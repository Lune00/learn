<?php
require_once '../../2-poo/autoLoad/autoLoad.php';
echo '<h3>Bonjour '.$_SESSION['nom'].' !</h3>';

$g = new Form2('Ajouter un véhicule', '#');
$g->setText('Immat.', '', true);
$g->setInput('date', 'Date', true);
$g->setText('Marque', '', true);
$g->setText('Modèle', '', true, ['list' => 'idModelesPossibles']);
$g->setRadioButton('Essence', 'Carb', true);
$g->setRadioButton('Diesel', 'Carb');
$g->setRadioButton('GPL', 'Carb');
$g->setRadioButton('Electrique', 'Carb');
$g->setSubmit('Enregistrer');
echo $g->getForm();
