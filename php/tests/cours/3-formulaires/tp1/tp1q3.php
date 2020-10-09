<?php
require_once '../../2-poo/autoLoad/autoLoad.php';

$valider = filter_input(INPUT_POST, 'Valider', FILTER_SANITIZE_STRING);
if (!$valider) {
    $formulaire3 = new Form2('S\'abonner', '#');
    $formulaire3->setText('E-Mail', '', true);
    $formulaire3->setInput('hidden', 'Agent', false, ['value' => $_SERVER['HTTP_USER_AGENT']]);
    $formulaire3->setSubmit('Valider');
    echo $formulaire3->getForm();
} else {
    //$email = filter_input(INPUT_POST, 'Email', FILTER_VALIDATE_REGEXP, ['options' => ['regexp' => '#[a-z\.\-0-9]+@[a-z\.\-0-9]+\.[a-z\.\-0-9]+#i']]);
    $email = filter_input(INPUT_POST, 'Email', FILTER_SANITIZE_EMAIL);
    $agent = filter_input(INPUT_POST, 'Agent', FILTER_SANITIZE_STRING);
    echo 'e-mail : ' . $email . ' ; agent : ' . $agent;
}
