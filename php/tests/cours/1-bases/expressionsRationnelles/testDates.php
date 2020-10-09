<?php
$motif = '#^([0-9]{1,2})/([0-9]{1,2})/([0-9]{4})$#';

// Tableau contenant les chaines à tester :
$dates[] = '1/4/2018'; // OK
$dates[] = '10/04/2018'; // OK
$dates[] = '10/04/18'; // KO car l'année n'est pas sur 4 chiffres

echo '<ul>';
foreach ($dates as $date) {
    echo '<li>Test de ' . $date . ' : ';
    $ok = (preg_match($motif, $date, $resultat) > 0);
    if ($ok) {
        echo 'est valide :<ul><li>jour : ' . $resultat[1] . '</li><li>mois : ' . $resultat[2] . '</li><li>année : ' . $resultat[3] . '</li></ul></li>';
    } else {
        echo 'n\'est pas valide';
    }
}
echo '</ul>';
