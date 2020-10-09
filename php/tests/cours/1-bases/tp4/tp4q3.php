<?php
require_once 'tp4q3f.php';

$a = rand(1, 10000);
$b = rand(1, 10000);

echo 'Le plus grand diviseur commun de ' . $a . ' et ' . $b . ' est ' .
    pgcd($a, $b) . '<br>';
