<?php

function greet($a)
{
    return function () use ($a) {
        print $a;
    };
}

$sayHi = greet('hi');
$sayHi();

//Closue (au sens general)
function incrementBy($inc)
{
    return function ($x) use ($inc) {
        return $x + $inc;
    };
}

$add1 = incrementBy(1);
print $add1(5);


function add($a, $b)
{
    return $a + $b;
}
function times($a, $b)
{
    return $a * $b;
}


//Partial application : fixing a number of arguments to a function, producing another function of smaller arrity
function operation(callable $fn, int $b)
{
    return function (int $a) use ($fn, $b) {
        return $fn($a, $b);
    };
}

$add2 = operation("add", 2);
print $add2(3);


/**
 * PHP : Generic partial application operator => fixing a number of arguments to a function, producing another function of smaller arrity.
 * En gros : on initialise une fonction avec l'un de ses parametres, on renvoie donc une fonction avec une arité plus faible
 */
function partial(callable $fn, ...$x)
{
    return function (...$y) use ($fn, $x) {
        return $fn(...array_merge($x, $y));
    };
}

function full_name($first, $last)
{
    return $first . " " . $last;
}

$ericsOnly = partial('full_name', 'Eric');
print $ericsOnly('Schuhmacher');

$add1 = partial('add', 1);
$times3 = partial('times', 3);

print $add1(14);
print $times3(5);

//Just to practice
function partial2(callable $fn, ...$x)
{
    return function (...$y) use ($fn, $x) {
        return $fn(...array_merge($x, $y));
    };
}
