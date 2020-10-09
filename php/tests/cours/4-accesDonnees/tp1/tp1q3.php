<?php
require_once '../../2-poo/autoLoad/autoLoad.php';

$f = new Form2('Accédez à vos informations', 'tp1q3pageModif.php');
$f->setInput('number', 'Numéro d\'identification');
$f->setText('Nom de famille');
$f->setSubmit('Connexion');
echo $f->getForm();