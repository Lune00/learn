<?php
require 'tp2q2.php';
echo '<ul>';
foreach ($personnes2 as $nom => $valeurs) {
    echo "<li>Element $nom<ul>";
    foreach ($valeurs as $clé => $valeur) {
        echo "<li>$clé : $valeur</li>";
    }
    echo "</ul></li>";
}
echo '</ul>';
