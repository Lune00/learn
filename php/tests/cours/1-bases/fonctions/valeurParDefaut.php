<?php
define('QUATRE', 4);

function produit($valeur1 = QUATRE, $valeur2 = 2) {
    return $valeur1 * $valeur2;
}

echo '<p><code>produit(5, 3)</code> : 5 × 3 = ' . produit(5, 3) . '<br>';
echo '<code>produit(5)</code> : 5 × 2 = ' . produit(5) . '<br>';
echo '<code>produit()</code> : 4 × 2 = ' . produit() . '</p>';
