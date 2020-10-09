<?php
$villes_france[] = 'Paris';
$villes_france[] = 'Lyon';
$villes_france[] = 'Nantes';
var_dump($villes_france);

$villes_italie[] = 'Rome';
$villes_italie[] = 'Venise';
var_dump($villes_italie);

$villes['FRANCE'] = $villes_france;
$villes['ITALIE'] = $villes_italie;
var_dump($villes);
