<?php
require 'tp2q1.php';
echo '<ul>';
foreach ($personnes as $nom => $valeurs) {
    echo '<li>Element ' . $nom . '<ul>';
    for ($i = 0; $i < count($valeurs); $i++) {
        echo '<li>élément ' . $i . ' : ' . $valeurs[$i] . ' </li>';
    }
    echo '</ul></li>';
}
echo '</ul>';
