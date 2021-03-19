<?php

function foo(string $a, int $b)
{
    echo $a.' and '.$b . "\n";
}

foo('foo', 1);
foo(1, '1foo'); //Warning but executes
foo(1, 'foo'); //Fatal
foo('foo', 'bar'); //Fatal
foo(array(1,2,3), 1); //Fatal
