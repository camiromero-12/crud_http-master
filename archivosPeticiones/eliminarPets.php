<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header("HTTP/1.1 200 OK");
die();
}


    require "config.php";

    
     if( isset($_POST['id'])) {
         
         $id=$_POST['id'];
         
       $sql = "DELETE FROM pets2 WHERE id='$id'";
    

    if (mysqli_query($con, $sql)) {
         $clientes[] = array('mensaje'=> "Mascota eliminada");
  } else {
       $clientes[] = array('mensaje'=> "Mascota no elimnada");
  }
     }else{
          $clientes[] = array('mensaje'=> "Error del sistema");
     }
     

    
   
$json_string = json_encode($clientes);
echo $json_string;
?>