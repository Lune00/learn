<?php


class BoxArray
{
    private $x;
    private function __construct($x)
    {
        $this->x = $x;
    }

    //Of: une seule valeur (on la garde si on passe une valeur, on la transforme en array)
    public static function of($x)
    {
        return static::from([$x]);
    }

    //From : quand on prend une liste en argument
    public static function from($x)
    {
        return new static($x);
    }
    public function __invoke()
    {
        return $this->x;
    }
    public function map(callable $fn)
    {
        return static::from(array_map($fn, $this->x));
    }
    public function filter(callable $fn)
    {
        return static::from(array_filter($this->x, $fn));
    }
    public function reduce(callable $fn, $seed)
    {
        return static::from(array_reduce($this->x, $fn, $seed));
    }
}

//Reduce
print array_reduce(array(1, 2, 3), function ($acc, $x) {
    return $acc + $x;
}, 0) . PHP_EOL;

function square(int $a)
{
    return $a * $a;
}

function isOdd(int $x)
{
    return $x % 2 === 1;
}

function add(int $a, int $b)
{
    return $a + $b;
}


//Sum of the odd squares

$arr = array(1, 2, 3, 4, 5);

print BoxArray::from($arr)
    ->map('square')
    ->filter('isOdd')
    ->reduce('add', 0)();
