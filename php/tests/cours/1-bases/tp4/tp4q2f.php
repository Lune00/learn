<?php
function ordonnerDesc(&$a, &$b) {
    if($a<$b) {
        $t = $a;
        $a = $b;
        $b = $t;
    }
}