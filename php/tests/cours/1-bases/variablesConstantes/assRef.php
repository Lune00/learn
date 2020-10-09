<?php
$nom1 = 'Duchemin';
$nom2 = &$nom1;
$nom2 = 'Robert';
echo '$nom1 = ' . $nom1 . ' et $nom2 = ' . $nom2 . '<br>';
