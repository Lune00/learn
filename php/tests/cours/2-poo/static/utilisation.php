<?php
require_once '../classes/UtilisateurAvecMatricule.class.php';
echo 'nombre d\'utilisateurs avec matricule : ' . UtilisateurAvecMatricule::nombreDEmpoyesAvecMatricule() . '<br>';
$antoine = new UtilisateurAvecMatricule('Antoine', 'Lavoisier');
echo $antoine->informations() . '<br>';
echo 'nombre d\'utilisateurs avec matricule : ' . UtilisateurAvecMatricule::nombreDEmpoyesAvecMatricule() . '<br>';
$albert = new UtilisateurAvecMatricule('Albert', 'Schweitzer');
echo $albert->informations() . '<br>';
echo 'nombre d\'utilisateurs avec matricule : ' . UtilisateurAvecMatricule::nombreDEmpoyesAvecMatricule() . '<br>';
