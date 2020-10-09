<?php
require_once '../classes/Ville.class.php';

$ca = new Ville;
$ca->setNom('Carquefou');
$ca->setDepartement('Loire Atlantique');
echo $ca;

$ni = new Ville;
$ni->setNom('Niort');
$ni->setDepartement('Les deux Sèvres');
echo $ni;
