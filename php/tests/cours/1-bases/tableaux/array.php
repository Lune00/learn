<?php
$nombres = array('zéro', 'un', 'deux', 'trois', 5 => 'cinq', 'six', 'un' => 1, 'sept', -1 => 'moins un');
// ou bien
$nombres = ['zéro', 'un', 'deux', 'trois', 5 => 'cinq', 'six', 'un' => 1, 'sept', -1 => 'moins un'];
var_dump($nombres);

$villes = array('FRANCE' => array('Paris', 'Lyon', 'Nantes'), 'ITALIE' => array('Rome', 'Venise'));
// ou bien
$villes = ['FRANCE' => ['Paris', 'Lyon', 'Nantes'], 'ITALIE' => ['Rome', 'Venise']];
var_dump($villes);
