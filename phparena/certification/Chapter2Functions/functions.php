<?php

//Strict mode
declare(strict_types=1);

//Typed arguments (to raise Errors or Warnings)
function foo(string $a, int $b)
{
    echo $a.' and '.$b . "\n";
}

// foo('foo', 1);
// foo(1, '1foo'); //Warning but executes
// foo(1, 'foo'); //Fatal
// foo('foo', 'bar'); //Fatal
// foo(array(1,2,3), 1); //Fatal


// function bar($a, $b) : int {
//     return $a + $b;
// }

// echo bar(1,2);
// echo bar(1,2.1); //Fatal

//Null type syntax

// function testNull(?int $a){
//     return $a;
// }
// // echo testNull(); //Fatal, no optional argument anymore
// echo testNull(1); 

//OVerloading not possible with name, foo is already declared above
// function foo($a){ 
//     return $a;
// }

// function bar(){
//     foreach(func_get_args() as $arg => $value){
//         echo "arg :" . $arg . ' value = ' . $value;
//     }
// }

// bar(1,2,'foo');

//Variadic
// function variadic_function($required, $optional = null, ...$others){
//     var_dump($others);
//     printf('Required: %d; Optional: %d; Variadic number: %d',$required, $optional, count($others));
// }

// variadic_function(1,2,3);
// variadic_function(1,2,3, 4, 'foo');

//Default passed by Value:

// $a = array(1,2,3);
// function byValue($a){
//     $a[0] = 'foo';
// }
// var_dump($a);

// $lambda = function($a,$b){
//     return $a+$b;
// };

// echo gettype($lambda) . "\n";
// echo (int) is_callable($lambda) . "\n";
// echo get_class($lambda) . "\n";

// $string = 'foo';
// $closure = function() use($string){
//     $string = 'bar';
//     echo $string . "\n";
// };
// $closure();
// echo $string . "\n";


// $array = array(1,2,3);
// $closure_array = function() use($array){
//     $array[0]= 'foo';
// };
// $closure_array();
// var_dump($array);

// function is_this_function_callable(){
//     echo 'oui, toute fonction est callable';
// }
// echo is_callable('is_this_function_callable');


// $string='hello dear';
// $closure_eraly_binding_default = function() use($string){
//     echo $string . " \n";
// };
// $string='you are not funny anymore';
// $closure_eraly_binding_default();
// $closure_late_binding = function() use(&$string){
//     echo $string . " \n";
// };
// $closure_late_binding();

//Binding closures to another scope

// class Animal{
//     public function getClosure(){
//         $variable = 'Animal';
//         return function() use($variable){
//             return $this->nature . ' ' . $variable;
//         };
//     }
// }

// class Cat extends Animal{
//     protected $nature = 'Cat';
// }

// class Dog extends Animal{
//     protected $nature = 'Dog';
// }

// $a = new Cat();
// $closure = $a->getClosure();
// $closure =  $closure->bindTo(new Dog());
// echo $closure();

//Different callables

function toto(){
    echo "toto!";
}
call_user_func('toto');

class Foo{
    static function sayHi(){
        echo "Hi";
    }
    function sayGoodBye(){
        echo "Goodbye";
    }
}

// call_user_func(array(new Foo, 'sayHi'));
// call_user_func(array(new Foo, 'sayGoodBye'));
// call_user_func('Foo::sayHi');
// call_user_func('Foo::sayGoodBye');


echo 'Namepsace global est vide :'  . (int) __NAMESPACE__;