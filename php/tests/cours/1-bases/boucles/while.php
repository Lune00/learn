<?php
$i = 1;

// Forme une seule instruction
while ($i <= 3)
    echo 'passage n°' . $i++ . '<br>';

// Forme bloque
while ($i > 0) {
    echo 'valeur de i : ' . $i . '<br>';
    $i--;
}

// Forme alternative
while ($i < 3):
    echo ' i = ' . $i . '<br>';
    $i++;
endwhile;
