<?php
require_once '../classes/FormSimple.class.php';

$form1 = new FormSimple('Formulaire de test', '#');
$form1->setText('nom de famille', 'nom');
$form1->setText('prénom', 'prenom');
$form1->setSubmit('Envoyer le formulaire');
echo $form1->getForm();
