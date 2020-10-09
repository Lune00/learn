<?php
$filtreMDP = array(
    'filter' => FILTER_VALIDATE_REGEXP,
    'options' => array('regexp' => '#^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$#')
);

$filtre = array(
    'age' => FILTER_VALIDATE_INT,
    'email' => FILTER_VALIDATE_EMAIL,
    'mdp' => $filtreMDP,
    'notation' => FILTER_VALIDATE_INT // il n'a pas de saisie 'notation' !
);

var_dump(filter_var_array($_POST['saisie'], $filtre));
