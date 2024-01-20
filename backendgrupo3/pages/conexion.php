<?php

if (session_status() === PHP_SESSION_ACTIVE) {
} else {
    session_start();
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "proyectomoviles";

// Crea la conexión
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Verifica si hay errores en la conexión
if (!$conn) {
    echo("Conexión fallida: " . mysqli_connect_error());
}

?>