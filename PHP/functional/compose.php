<?php

class Box
{
    private $x;
    private function __construct($x)
    {
        $this->x = $x;
    }
    public static function of($x)
    {
        return new static($x);
    }
    //La méthode __invoke est appelée quand un script tente d'appeler un objet comme une fonction
    public function __invoke()
    {
        return $this->x;
    }

    //Retourne un Box avec pour valeur la valeur mappée par la fonction fn
    public function map(callable $fn)
    {
        return static::of($fn($this->x));
    }
}
function add(int $a, int $b)
{
    return $a + $b;
}
function times(int $a, int $b)
{
    return $a * $b;
}

function partial(callable $fn, ...$x)
{
    return function (...$y) use ($fn, $x) {
        return $fn(...array_merge($x, $y));
    };
}

$add1 = partial('add', 1);
$times3 = partial('times', 3);
$result =  Box::of(2)
    ->map($add1)
    ->map($times3)();

print $result;
