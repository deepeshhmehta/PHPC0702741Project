<?php
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
    // print_r("ALL DATA TYPES<br/>-------<br/>");
    // print_r($master_data);

      foreach ($master_data as $typeKey => $type) {

        $sql = "SELECT * from data d WHERE d.data_type_id = ".$type['id']. " ORDER BY order_no";
        $stmt = $this->db->prepare($sql);
        $stmt->execute();

        $dataO = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // print_r("<br/><br/>".$type['data_type_name']."<br/>-------<br/>");
        // print_r($dataO);
        // print_r($type['data_type_name']);
        // print_r("<br/><br/>");
        // print_r($dataO);
        // print_r("<br/><br/>");
        $data = Array();
        foreach ($dataO as $key => $value) {
          // print_r($value);
          $sql = "SELECT * from data_metadata dm ";
          $sql.= "LEFT JOIN data_types_metadata m on m.id = dm.data_types_metadata_id ";
          $sql.= "WHERE dm.data_id = ".$value['id']." ";
          $stmt = $this->db->prepare($sql);
          $stmt->execute();
          $data_metadata = $stmt->fetchAll(PDO::FETCH_ASSOC);
          $data[$key]['metadata'] = Array();
          array_push($data[$key]['metadata'], $data_metadata);
        }
        // print_r("<br/><br/><br/><br/><br/>");
        $master_data[$typeKey]['data'] = $data;
        // array_push($master_data[$typeKey]['data'], $data);
      }
      // die();
      // print_r($master_data);
      // die();
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
        // print_r($dataInstance);
        foreach ($dataInstance['metadata'] as $dataMetadataKey => $dataMetadata) {
          foreach ($dataMetadata as $metaDataInstance => $metaDataInstanceValue) {
            $packaged_data_instance_metadata[$metaDataInstanceValue['field_name']] = $metaDataInstanceValue['value'];
          }
          // print_r($dataMetadata);
        }
        array_push($packaged_data_instances, $packaged_data_instance_metadata);
      }
      $packaged_data[$value['data_type_name']] = $packaged_data_instances;
    }
    // print_r($packaged_data);
    // die();
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

    return array( 
          ['idToggle'=>'aboutToggle','idDetails'=>'aboutDetails','section_name'=>"about",'matter' =>$about],
          ['idToggle'=>'workToggle','idDetails'=>'workDetails','section_name'=>"work",'matter' =>$work],
          ['idToggle'=>'skillsToggle','idDetails'=>'skillsDetails','section_name'=>"skills",'matter' =>$skills],
          ['idToggle'=>'educationToggle','idDetails'=>'educationDetails','section_name'=>"education",'matter' =>$education],
          ['idToggle'=>'strengthToggle','idDetails'=>'strengthDetails','section_name'=>"strength",'matter' =>$strength]
        );

  }

}
?>