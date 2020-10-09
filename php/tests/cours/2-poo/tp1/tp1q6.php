<?php
require_once '../classes/Form2.class.php';

$formulaire1 = new Form2('Formulaire de test', '#');
$formulaire1->setText('date de naissance', '17/12/1989', true,
        array('placeholder' => 'jj/mm/aaaa',
            'title' => 'Votre date de naissance (jj/mm/aaaa)',
            'maxlength' => '10'));
$formulaire1->setInput('password', 'Mot de passe', true);
$formulaire1->setInput('file', 'Photo');
$formulaire1->setCheckBox("J'accepte de recevoir de la publicité", true);
$formulaire1->setRadioButton('Féminin', 'sexe');
$formulaire1->setRadioButton('Masculin', 'sexe');
for ($i = 1; $i <= 5; $i++) {
    $formulaire1->setRadioButton($i . ' étoile' . ($i > 1 ? 's' : ''), 'note',
            false, true, array('value' => $i));
}
$formulaire1->setSubmit('Envoyer le formulaire');
echo $formulaire1->getForm();
