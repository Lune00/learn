<?php


echo 0 == 'foobar';

function foo($a, $b = 0, $c = 3)
{
    echo $a + $b + $c;
}

//Named arguments
echo foo(1, c: 2, b: 10);
