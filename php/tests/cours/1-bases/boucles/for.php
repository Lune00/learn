<?php
// Forme une seule instruction
for ($i = 1; $i < 4; $i++)
    echo 'passage n°' . $i . '<br>';

// Forme bloque
for ($i = 7; $i < 10; $i++) {
    echo 'valeur de i : ' . $i . '<br>';
}

// Forme alternative
for ($i = 12; $i < 15; $i++):
    echo '$i =' . $i . '<br>';
endfor;
