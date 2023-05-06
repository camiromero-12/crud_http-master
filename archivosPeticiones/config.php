<?php

session_start();
$host = "localhost"; /* equipo */
$user = "id20606553_cami"; /* usuario */
$password = "16032008AAndrea#"; /* clave */
$dbname = "id20606553_petscrud"; /* base de datos */

$con = mysqli_connect($host, $user, $password,$dbname);

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
//echo "Conexion Exitosa";

?>


