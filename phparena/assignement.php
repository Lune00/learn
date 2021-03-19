<?php

$a = array('1', 2, 3, 4);
$b = $a; //copy
$b['1'] = 'toto';
$a[4] = 'toto';
$a[] = 'at the end';
var_dump($a);
var_dump($b);

class Foo
{
    public $bar = 'bar';
    function __construct()
    {
    }
    function show()
    {
        echo $this->bar;
    }
};

$foo = new Foo();

$foo->show();

//Passage par valeur (or ici la valeur est une reference vers l'objet, donc comme un passage 'par reference' pour les objets en php)
function dostuff($foo)
{
    $foo->bar = 'foo';
};
dostuff($foo);
$foo->show();
