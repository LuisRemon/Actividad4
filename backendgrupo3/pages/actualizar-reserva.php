<?php
include("conexion.php");

$id_reserva = $_GET['id_reserva'];

$sql = "UPDATE reserva SET id_estado=1 WHERE id_reserva=$id_reserva";

    if ($conn->query($sql) === TRUE) {
        echo '<script>window.location.href = "validacion-reservas.php";</script>';
	exit;
    } else {
        echo "Error updating record: " . $conn->error;
    }
?>
