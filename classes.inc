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

}
?>