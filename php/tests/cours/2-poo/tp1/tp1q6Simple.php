<?php
require_once '../classes/FormSimple2.class.php';

$formulaire1 = new FormSimple2('Formulaire de test', '#');
$formulaire1->setCheckBox("J'accepte de recevoir de la publicité", 'pub');
$formulaire1->setRadioButton('Féminin',  'F', 'sexe');
$formulaire1->setRadioButton('Masculin', 'M', 'sexe');
for ($i = 1; $i <= 5; $i++) {
    $formulaire1->setRadioButton($i . ' étoile' . ($i > 1 ? 's' : ''), $i, 'note');
}
$formulaire1->setSubmit('Envoyer le formulaire');
echo $formulaire1->getForm();
