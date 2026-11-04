<?php 
$host = "localhost";
$db_name = "food";
$username = "root";
$password = "";

$conn = new mysqli($host, $username,$password,$db_name);

if ($conn ->connect_errno){
    print("connect field" . $conn-> connect_errno);
}




?>
