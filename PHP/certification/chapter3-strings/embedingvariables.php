<?php

class Foo
{
    public $bar = 'bar';
}

$foo = new Foo();
$toto = 'toto';
$arr = [1, 2, 3];


echo "I want {a}" . PHP_EOL;
echo "I want $foo->bar" . PHP_EOL;
echo "I want {$foo->bar}s" . PHP_EOL;
echo "I want {$foo->bar}s" . PHP_EOL;
echo "I am {$toto}s" . PHP_EOL;
echo "I am ${toto}s" . PHP_EOL;
echo "I need {$arr[0]}s" . PHP_EOL;

//Toujours utiliser la syntax {$variable} plutot que ${variable}. La premiere marche avec des tableaux,objets

echo "\u{1F418}" . PHP_EOL;


empty($variable0);
isset($variable0);
is_null($variable0); //genere un warning
