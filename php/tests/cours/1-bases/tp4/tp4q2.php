<?php
require_once 'tp4q2f.php';

$a = rand(1, 10);
$b = rand(1, 10);

echo 'Initialement : ' . $a . ' ; ' . $b . '<br>';

ordonnerDesc($a, $b);

echo 'Dans l\'ordre décroissant : ' . $a . ' ; ' . $b . '<br>';
