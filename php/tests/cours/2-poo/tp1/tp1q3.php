<?php
require_once '../classes/VilleAvecRegion.class.php';

$lr = new VilleAvecRegion('La Roche sur Yon', 'Vendée', 'Pays de la Loire');
echo $lr;

$q = new VilleAvecRegion('Quimper', 'Finister', 'Bretagne');
echo $q;
