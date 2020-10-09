<?php
require_once '../classes/Vegetarien.class.php';

echo 'création d\'une instance de lapin<br>';
$lapin = new Vegetarien('Lapin');

echo '<code>$lapin</code> = ' . $lapin . '<br>';
echo 'Appel à <code>$lapin->mange()</code><br>';
$lapin->mange();
