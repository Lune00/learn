<?php
$a = 64;
$b = 42;

// Forme une seule instruction
if($a > $b)
    echo 'a est plus grand que b.<br>';
else
    echo 'a est plus petit ou égal à b.<br>';

// Forme "bloque"
if($a > $b) {
    echo 'a est plus grand que b.<br>';
    $b = $a;
} else {
    echo 'a est plus petit ou égal à b.<br>';
}

// Forme alternative
if($a !== $b):
    echo 'a et b ont des valeurs différentes.<br>';
else:
    echo 'a et b ont la même valeur.<br>';
endif;
