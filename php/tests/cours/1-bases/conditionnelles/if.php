<?php
$a = 64;
$b = 42;

// Forme une seule instruction
if($a > $b)
    echo 'a est plus grand que b.<br>';

// Forme "bloque"
if($a > $b) {
    echo 'a est plus grand que b.<br>';
    $b = $a;
}

// Forme alternative
if($a === $b):
    echo 'a et b ont la même valeur.<br>';
endif;
