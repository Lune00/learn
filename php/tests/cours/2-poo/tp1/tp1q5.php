<?php
require_once '../classes/Form.class.php';

$form1 = new Form('Formulaire de test', '#');
$form1->setText('nom de famille', 'Durand', true,
        ['placeholder' => 'Votre nom...',
            'title' => 'Votre nom (maximum 30 caractères)',
            'maxlength' => '30']);
$form1->setText('prénom');
$form1->setSubmit('Envoyer le formulaire');
echo $form1->getForm();
