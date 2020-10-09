<?php
require_once '../classes/VilleCtr2.class.php';
require_once '../classes/VilleCtrAvecRegion.class.php';

$lrsy = new VilleCtr2('La Roche sur Yon', 'Vendée');
$q  = new VilleCtr2('Quimper', 'Finister');
$cm = new VilleCtr2('Charleville-Mézières', 'Ardennes');
$r = new VilleCtr2('La Rochelle', 'Charentes Maritime');

$s = new VilleCtrAvecRegion('Saint Herblain', 'Loire Atlantique', 'Pays de la Loire');

echo 'La ville ayant le nom le plus long est : ' . VilleCtr2::getNomLePlusLong();