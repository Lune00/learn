<?php
require '../../2-poo/autoLoad/autoLoad.php';

$f = new Form2('Ajouter un nouveau modèle', '');
$f->setText('Identifiant', '', true);
$f->setText('Marque', '', true);
$f->setText('Modèle', '', true);
$f->setRadioButton('Essence', 'Carburant', true);
$f->setRadioButton('Diesel', 'Carburant');
$f->setRadioButton('GPL', 'Carburant');
$f->setRadioButton('Electrique', 'Carburant');
$f->setSubmit('Ajouter');
echo $f->getForm();
