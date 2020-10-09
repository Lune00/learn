<?php
$a = 64;
$b = 42;

// Forme une seule instruction
if($a > $b)
    echo 'a est plus grand que b.<br>';
elseif($a < $b)
    echo 'a est plus petit que b.<br>';
else
    echo 'a est égal à b.<br>';

// Forme "bloque"
if($a > $b) {
    echo 'a est plus grand que b.<br>';
    $b = $a;
} elseif($a < $b) {
    echo 'a est plus petit que b.<br>';
} else {
    echo 'a est égal à b.<br>';
}

// Forme alternative
if($a > $b):
    echo 'a est plus grand que b.<br>';
elseif($a < $b):
    echo 'a est plus petit que b.<br>';
else:
    echo 'a est égal à b.<br>';
endif;
