<?php
declare(strict_types=1);
namespace foo\bar;

class Toto{

}
// echo 2 << 1;
// echo 2 >> 1 ;

// echo 10 == '10aa5';
// echo 10 == 'a10';

// echo null && 1;
// echo "\n";
// echo null + 1;
// echo __FILE__;
// echo __DIR__;
// echo __NAMESPACE__;

// echo Toto::class . ' '. TOTO::class;
// $toto = TOTO::class;
// var_dump(new $toto);

$foo = function(){ echo "I'am a closure";};

function foo_call(){
  echo "Hello";
}

var_dump($foo, gettype($foo), is_callable($foo));

function bar(Callable $c){
    $c();
}


// bar( __NAMESPACE__ ."\\foo_call");
// bar( __NAMESPACE__ ."\\foo");

//Sleft executing

(function(){
  echo 'Self executing';
})();


function multiply(float $a, float $b): float {
  return $a * $b;
}
$six = multiply(2, 3);
echo gettype($six);