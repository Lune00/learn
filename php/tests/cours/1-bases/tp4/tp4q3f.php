<?php
require_once 'tp4q2f.php';

function pgcd($a, $b) {
    ordonnerDesc($a, $b);
    do {
        $r = $a % $b;
        $a = $b;
        $b = $r;
    } while ($r !== 0);
    return $a;
}
