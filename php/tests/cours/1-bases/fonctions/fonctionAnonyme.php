<?php
$resultat = operation(5, 8, function($valeur1, $valeur2) {
    return $valeur1 - $valeur2;
});
echo 'Soustraction 5 - 8 = ' . $resultat . '<br>';

$soustraction = function($valeur1, $valeur2) {
    return $valeur1 - $valeur2;
};
echo 'Soustraction 2 - 2 = ' . $soustraction(2, 2), '<br>';
