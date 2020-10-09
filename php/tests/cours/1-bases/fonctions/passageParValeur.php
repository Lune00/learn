<?php
function multiplieValeur($valeur, $multiplicateur) {
    $valeur *= $multiplicateur;
    echo 'Valeur multipliée dans la fonction : ' . $valeur . '<br>';
}

$valeur = 10;
echo 'Valeur avant la fonction : ' . $valeur . '<br>';
multiplieValeur($valeur, 2);
echo 'Valeur après la fonction : ' . $valeur . '<br>';
