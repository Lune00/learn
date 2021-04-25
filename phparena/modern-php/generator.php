<?php

#Generators

function simple_generator()
{
    yield '1';
    yield '2';
    yield '3';
}

foreach (simple_generator() as $value) {
    echo $value . PHP_EOL;
}

function range_generator(int $a, int $b)
{
    for ($i = $a; $i !== $b; $i++) {
        yield $i;
    }
}

foreach (range_generator(1, 10) as $value) {
    echo $value . PHP_EOL;
}

$a = range_generator(1, 10);
var_dump($a->current());
$a->next();
var_dump($a->current());
