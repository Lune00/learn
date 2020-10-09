<?php
session_start();
$_SESSION['nom'] = 'Legall';
$_SESSION['id_pers'] = 2;
header('Location:tp1q4c.php');
