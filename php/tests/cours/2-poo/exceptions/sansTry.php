<?php

require_once '../classes/Distance.class.php';

$i = mt_rand(-2, 2);
echo '*** Création d\'une distance de ' . $i . ' ***<br>';
$d1 = new Distance($i);
echo 'La distance a été créée sans qu\'aucune exception n\'ait été levée<br>';
