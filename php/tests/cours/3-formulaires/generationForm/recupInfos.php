<?php

$donnees = filter_input_array(INPUT_GET);
var_dump($donnees);

if (isset($donnees['btnValider'])) {
    $jours = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi'];
    echo 'Le jour choisi est le ' . $jours[$donnees['jour']] . '<br>';

    $cours = ['PHP', 'HTML', 'JavaScript', 'MySQL', 'CSS'];
    echo 'Les matières choisies sont :<ul>';
    foreach ($cours as $c)
        if(isset($donnees[$c]))
            echo '<li>'.$c.'</li>';
    echo '</ul>';
}

