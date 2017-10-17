<?php
if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 

class MyDataHandler {
  var $db;
  var $servername = "localhost:3306";
  var $username = "root";
  var $password = "";
  var $sql = "some statement";

  function __construct(){
    try{
      $this->db = new PDO("mysql:host=$this->servername;dbname=TestDatabase", $this->username, $this->password);
      $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch(PDOException $e){
      echo 'Constructor failed ' . $e->getMessage();
    }
  }

  function getData(){
    try {
      $sql = "SELECT * from data_types ORDER BY order_no";
      $stmt = $this->db->prepare($sql);
      $stmt->execute();
      $master_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
      foreach ($master_data as $typeKey => $type) {

        $sql = "SELECT * from data d WHERE d.data_type_id = ".$type['id']. " ORDER BY order_no";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();

        $dataO = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $data = Array();
        foreach ($dataO as $key => $value) {
          $sql = "SELECT * from data_metadata dm ";
          $sql.= "LEFT JOIN data_types_metadata m on m.id = dm.data_types_metadata_id ";
          $sql.= "WHERE dm.data_id = ".$value['id']." ";
          $stmt = $this->db->prepare($sql);
          $stmt->execute();
          $data_metadata = $stmt->fetchAll(PDO::FETCH_ASSOC);
          $data[$key]['metadata'] = Array();
          array_push($data[$key]['metadata'], $data_metadata);
        }
        $master_data[$typeKey]['data'] = $data;
      }

      return $master_data;
    }catch(PDOException $e){
      echo "get Data failed: " . $e->getMessage();
    }
  }

  function getPackagedData(){
    $raw_data = $this->getData();
    $packaged_data = Array();
    foreach ($raw_data as $key => $value) {
      $packaged_data[$value['data_type_name']] = Array();
      $packaged_data_instances = Array();
      foreach ($value['data'] as $dataInstanceKey => $dataInstance) {
        $packaged_data_instance_metadata = Array();
        foreach ($dataInstance['metadata'] as $dataMetadataKey => $dataMetadata) {
          foreach ($dataMetadata as $metaDataInstance => $metaDataInstanceValue) {
            $packaged_data_instance_metadata[$metaDataInstanceValue['field_name']] = $metaDataInstanceValue['value'];
          }
        }
        array_push($packaged_data_instances, $packaged_data_instance_metadata);
      }
      $packaged_data[$value['data_type_name']] = $packaged_data_instances;
    }

    $header = $packaged_data['header'];
    $about = $packaged_data['about'];
    $rightpane = $packaged_data;
    unset($rightpane['header'],$rightpane['about']);
    return ['top'=> $header, 'left'=>$about, 'right'=> $rightpane];
  }

  function getAdminPanelPackegedData($raw_data){
    $packaged_data = Array();
    foreach ($raw_data as $key => $value) {
      if(!array_key_exists($value['data_id'], $packaged_data)){
        $packaged_data[$value['data_id']] = Array();  
      }

      $packaged_data[$value['data_id']][$value['field_name']] = $value['value'];
    }
    return $packaged_data;
  }

  function getAdminPanelData($typeStr){
    $sql = "SELECT dm.id,dm.data_id,dm.data_types_metadata_id,dm.value,dtm.data_type_id,dtm.field_name 
            FROM `data_metadata` dm LEFT JOIN `data_types_metadata` dtm ON
            dm.data_types_metadata_id = dtm.id
            WHERE data_id in 
              (SELECT `data`.id FROM `data` WHERE data_type_id = 
                (SELECT id FROM `data_types` WHERE data_type_name = '$typeStr')
              )";

    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $raw_data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $sql = "SELECT * FROM `data_types_metadata` 
            WHERE data_type_id = (select id from data_types where data_type_name ='$typeStr')
            ORDER BY order_no";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $fields = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return ['fields'=>$fields, 'data'=> $this->getAdminPanelPackegedData($raw_data)];
  }

  function getAllSectionsAdminPanel(){
    $header = $this->getAdminPanelData('header'); 
    $about = $this->getAdminPanelData('about');
    $work = $this->getAdminPanelData('work');
    $skills = $this->getAdminPanelData('skills');
    $education = $this->getAdminPanelData('education');
    $strength = $this->getAdminPanelData('strength');
    $product = $this->getAdminPanelData('products');

    return array( 
          ['idToggle'=>'aboutToggle','idDetails'=>'aboutDetails','section_name'=>"about",'matter' =>$about],
          ['idToggle'=>'workToggle','idDetails'=>'workDetails','section_name'=>"work",'matter' =>$work],
          ['idToggle'=>'skillsToggle','idDetails'=>'skillsDetails','section_name'=>"skills",'matter' =>$skills],
          ['idToggle'=>'educationToggle','idDetails'=>'educationDetails','section_name'=>"education",'matter' =>$education],
          ['idToggle'=>'strengthToggle','idDetails'=>'strengthDetails','section_name'=>"strength",'matter' =>$strength],
          ['idToggle'=>'productToggle','idDetails'=>'productDetails','section_name'=>"products",'matter' =>$product]
        );
  }

  function updateData($data){
    $id = $data['data_id'];
    $sql = "SELECT dm.id, dm.value, dtm.field_name 
            FROM `data_metadata` dm 
            LEFT JOIN data_types_metadata dtm ON dm.data_types_metadata_id = dtm.id 
            WHERE dm.data_id = $id ";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $metadatas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    try{
      foreach ($metadatas as $key => $metadata) {
        $newValue = $data[$metadata['field_name']];
        $meta_id = $metadata['id'];
        $sql = "UPDATE data_metadata SET value = :new_value WHERE id = :meta_id";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':new_value',$newValue);
        $stmt->bindValue(':meta_id',$meta_id);
        $stmt->execute();
      }
    }catch(PDOException $e){
      echo 'upDate failed ' . $e->getMessage();
    }
    echo '<script type="text/javascript">location.href = "./admin.php";</script>';
  }

  function deleteData($data){
    try{
      $id = $data['data_id'];
      $sql = "DELETE from `data_metadata` WHERE data_id = $id; DELETE from `data` WHERE id = $id;";
      $stmt = $this->db->prepare($sql);
      $stmt->execute();
    }catch(PDOException $e){
      echo 'Delete failed ' . $e->getMessage();
      die();
    }
    echo '<script type="text/javascript">location.href = "./admin.php";</script>';
  }

  function addData($data){
    try{
      $data_type = $data['data_type_id'];
      $sql = "SELECT *
              FROM `data_types_metadata` dm
              WHERE dm.data_type_id = $data_type
              ORDER BY order_no";
      $stmt = $this->db->prepare($sql);
      $stmt->execute();
      $fields = $stmt->fetchAll(PDO::FETCH_ASSOC);
      $sql = "SELECT *
              FROM `data_types` dm
              WHERE dm.id = $data_type";
      $stmt = $this->db->prepare($sql);
      $stmt->execute();
      $data_type_obj = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $title = strtoupper($data_type_obj[0]['data_type_name']) . "(".$data[$fields[0]['field_name']].")";

      $sql = "SELECT max(order_no) from `data` where data_type_id = $data_type";
      $stmt = $this->db->prepare($sql);
      $stmt->execute();
      $max_order = $stmt->fetchAll();
      $max_order = $max_order[0][0] + 1;
      
      $sql = "INSERT into `data` values (NULL,:title,:data_type_id,:max_order)";
      $stmt = $this->db->prepare($sql);
      $stmt->bindValue(':title',$title);
      $stmt->bindValue(':data_type_id',$data_type);
      $stmt->bindValue(':max_order',$max_order);
      $stmt->execute();
      $inserted_data = $this->db->lastInsertId();

      foreach ($fields as $key => $field) {
        $sql = "INSERT into `data_metadata` values(NULL,:data_id, :data_types_metadata_id,:value)";
        $stmt = $this->db->prepare($sql);
        $stmt->bindValue(':data_id',$inserted_data);
        $stmt->bindValue(':data_types_metadata_id',$field['id']);
        $stmt->bindValue(':value',$data[$field['field_name']]);
        $stmt->execute();
      }
    }catch(PDOException $e){
      echo 'add failed ' . $e->getMessage();
      die();
    }

    if($data_type == 8){
      echo '<script type="text/javascript">location.href = "./shop.php?alert=Success";</script>';  
    }else{
      echo '<script type="text/javascript">location.href = "./admin.php";</script>';
    }
    
  }

  function validateSession(){
    
    return (0 == strcmp($_SESSION['Auth'], "VaLiD"));
  }

  function validateShopSession(){
    
    return (0 == strcmp($_SESSION['UserAuth'], "VaLiD"));
  }

  function attemptAdminLogin($data){
    $user = $data['uname'];
    $sql = "SELECT * from `admin_credentials` WHERE user = '$user'";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();

    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($users as $key => $user) {
      if(password_verify($data['pass'], $user['password'])){
        $_SESSION['Auth'] = "VaLiD";
      }
    }
    echo '<script type="text/javascript">location.href = "./admin.php";</script>';
  }

  function attemptShopLogin($data){
    $user = $data['uname'];
    $sql = "SELECT * from `data_metadata` WHERE value = '$user' AND data_types_metadata_id = 25";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $message = "FAILED";

    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($users as $key => $user) {
      $dataId = $user['data_id'];
      $sql = "SELECT * from `data_metadata` WHERE data_id = '$dataId' AND data_types_metadata_id = 27";
      $stmt = $this->db->prepare($sql);
      $stmt->execute();
      $passwordList = $stmt->fetchAll(PDO::FETCH_ASSOC);
      foreach ($passwordList as $key => $value) {
        if(password_verify($data['pass'], $value['value'])){
          $_SESSION['UserAuth'] = "VaLiD";
          $_SESSION['User'] = $data['uname']; 
          $_SESSION['user_id'] = $dataId; 
          $message = "Success ".$data['uname'];
        }
      }
      
    }
    echo '<script type="text/javascript">location.href = "./shop.php?alert='.$message.'";</script>';
  }

  function generateHash($data){
    $hash = password_hash($data['pass'], PASSWORD_DEFAULT);
    $user = $data['uname'];
    print_r($hash);
    print_r("<br/><br/>");
    print_r($user);
    die();
  }

  function logout($type){
    $_SESSION = array(); //destroy all of the session variables
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }
    session_destroy();

    if($type = "SHOP"){
      echo '<script type="text/javascript">location.href = "./shop.php";</script>';
    }else{
      echo '<script type="text/javascript">location.href = "./admin.php";</script>';
    }
  }

  function checkout($data){
    // print_r($data);
    $products = explode(",",$data['products']);
    $user_id = $data['userid'];
    $code = $user_id;
    
    while(strlen($code)<4){
      $code = "0".$code;
    }
    $title = "ORDER(".$code.date("D M d, Y G:i").")";
    $sql = "SELECT max(order_no) from `data` where data_type_id = 9";
    $stmt = $this->db->prepare($sql);
    $stmt->execute();
    $max_order = $stmt->fetchAll();
    $max_order = $max_order[0][0] + 1;

    $sql = "INSERT into `data` values (NULL,:title,:data_type_id,:max_order)";
    $stmt = $this->db->prepare($sql);
    $stmt->bindValue(':title',$title);
    $stmt->bindValue(':data_type_id',9);
    $stmt->bindValue(':max_order',$max_order);
    $stmt->execute();
    $inserted_data = $this->db->lastInsertId();

    $sql = "INSERT into `data_metadata` values(NULL,:data_id, :data_types_metadata_id,:value)";
    $stmt = $this->db->prepare($sql);
    $stmt->bindValue(':data_id',$inserted_data);
    $stmt->bindValue(':data_types_metadata_id',28);
    $stmt->bindValue(':value',$user_id);
    $stmt->execute();

    foreach ($products as $value) {
      $sql = "INSERT into `data_metadata` values(NULL,:data_id, :data_types_metadata_id,:value)";
      $stmt = $this->db->prepare($sql);
      $stmt->bindValue(':data_id',$inserted_data);
      $stmt->bindValue(':data_types_metadata_id',29);
      $stmt->bindValue(':value',$value);
      $stmt->execute();
    }
    $message = "OrderPlaced: ". $title;
    echo 'Thank You For Shopping with us!';
    echo '<script> setTimeout(function(){ location.href = "./shop.php?alert='.$message.'"; }, 1000);</script>';
  }

}
?>