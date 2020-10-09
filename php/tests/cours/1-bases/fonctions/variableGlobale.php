<?php

$a = 67600;

function util_var_globale() {
    global $a;
    echo 'valeur de variable globale a : ' . $a . '<br>';
    $GLOBALS['b'] = 'test';
}

util_var_globale();
echo 'valeur de variable globale b : ' . $b;
