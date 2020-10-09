<?php
session_start();
// Détruit toutes les variables de session
$_SESSION = array();

header('Location: consultation.php');
