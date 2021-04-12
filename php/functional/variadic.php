<?php

function add($a, $b, $c)
{
    echo func_num_args();
    return $a + $b + $c;
}
$operators = [1, 2];
// echo add(1, ...$operators);


function foo(callable $fn, ...$x)
{
    return function (...$y) use ($fn, $x) {
        return $fn(...array_merge($x, $y));
    };
}

// echo foo('add',1, 2, 3, 4, 5, 6)();

echo add(1,2,3,4,5,6);