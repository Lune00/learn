<?php

//7 types : integer, real, boolean, array, object, string and null
define('foo', 1223);
echo foo;
// Strings
$foo = 'This is a \' string';
echo $foo;
$foo = "This is also a string \t Do you see?\n";
echo $foo;

echo "foo et \$foo ne sont pas la même chose ! foo est un identifiant pour une valeur, \$foo est identifiant pour une variable\n";
echo foo == $foo;

//Heredoc syntax
$bar = <<< bar
Heredoc syntax : Fonctionne comme double quote, on peut utiliser sequences d'echappement sans avoir besoin d'échapper les caractères \ \ 
$foo
bar;
echo $bar;

//Heredoc : call a function from heredoc with the function variable principle
function myFoo($a){
    return $a + 1;
}
$func='myFoo'; //alias
$a = <<<__foo
hello my friends\n How are you?\n
Let's call a function : myFoo, {$func(1)}
__foo;

echo $a;


//Nowdoc syntax
$bar = <<< 'bar'
Nowdoc syntax : Fonctionne comme simple quoteThis is a \' string
bar;
echo $bar;

echo "\n";
//Boolean

echo 'true(integer 1): ' . true . ' false(empty string): ' . false;

//Variables substitution in strings
$a = 'toto';
echo "The value of \$a is $a\n";
echo "They are {$a}ing\n";


//Constants
// define('foo', 1223);
echo $foo;

//Operators : modulo est signé (resultat a meme signe que la premiere operande)
echo 5 % 3 . "\n";
echo -5 % 3 . "\n";
echo 5 % -3 . "\n";
echo -5 % -3 . "\n";


$a = 1;
echo $a++ . "\n";
echo ++$a . "\n";

//Binary operators

echo 1 & 1;
echo "\n";
echo decbin(8);
echo "\n";
echo 1 & 5;
echo "\n";
echo 2 | 5;
echo "\n";
echo ~7;
echo "\n";
echo -4 >> 1;
echo "\n";

$a = 0b11111111;
echo $a . ' ' . ($a << 1);
echo "\n";

//Comparisons operators
// echo ( 10 == '10') . "\n";
// echo ( 10 == 'a10') . "\n";
// echo ( 10 == '10a2') . "\n";
// echo ( 0 == false) . "\n";

//Identity operators
// echo ( 10 === '10') . "\n";
// echo ( 10 !== '10') . "\n";
// echo ( 'foo' !== 'bar') . "\n";


echo (true xor true) . "\n";
echo (true xor false) . "\n";
echo ('' && true) . "\n";
echo ('foo' && true) . "\n";
echo ('0' && true) . "\n";
echo (0 && true) . "\n";
echo (false && true) . "\n";
echo (1 && true) . "\n";
echo (-1.5 && true) . "\n";

//Precedence and associativité

echo (2 / 3 / 4) . "\n";
echo (true && false) . "\n";
echo (true and false) . "\n";

//Attention, and et or ont pas la meme précedence que && et || (ils sont moins prio que '=')
$a = true and false; //équiv a ($a = true) and flase, on assigne true a $a , la comparaison est false mais assignée a rien (resultat perdu). Evalue a donne true
echo ($a) . "\n";
echo "understanding\n";
echo ($a = 1);
echo ($a) . "\n";


// switch (false) {

//     case true:
//         echo "True";
//         break;
//     case false:
//         echo "False";
// }

// //Nest loop and continue (oh my god...)
// for ($i = 0; $i < 10; $i++) {
//     while ($i < 5) {
//         if ($i === 3)
//             continue 2;
//         echo "while " . $i . "\n";
//         $i++;
//     }
//     echo "for " . $i . "\n";
// }

// echo (int) null;
// echo (string) null;
//NULL RAPPELS null est l'absence de toute valeur
echo (null && true);
echo (null || true);
if (!null)
    echo "null est toujours évalué à false dans une comparaison\n";

echo null + 10 . " : null est toujours évalué à 0 dans une opération avec un entier\n";
echo null . 'foo' . " : null est toujours évalué à chaine vide si casté en string\n";


//Variable number of arguments : func_num_args, func_get_arg($i), func_get_args
function average()
{

    $n_args = func_num_args();
    if ($n_args === 0)
        return 0;
    $args = func_get_args();
    $sum = 0.;
    // echo "func_get_arg()=". func_get_arg(2) ."\n";
    var_dump(func_get_args());
    foreach ($args as $arg) {
        $sum += $arg;
    }
    return $sum / $n_args;
}


echo average(10, 20, -5, 50.0) . ' ' . average(1);

//Variable variables
$a = 100;
$b = 'a';
echo $b . ' ' . $$b . "\n";

//Exercices precedence/associative
$a = 1;
$a = $a-- + 1;
echo $a;
$a = 1;
$a = ++$a + 1;
echo $a;

echo "\n";
echo true && false || true;
echo true && false || true || false && true;


// exit('toto');
$a = print 'foo';
echo $a;
echo empty(null) . ' ' . empty('0');

const FOO = 'foo';

echo FOO;
echo FOO . ' est fou';
$a = FOO . 'est a fou';
echo $a;


//Superglobals 9
var_dump($GLOBALS, $_SERVER, $_GET, $_POST, $_COOKIES, $_ENV, $_REQUEST, $_FILES, $_SESSION);

//Magic constants
var_dump(__LINE__, __FILE__, __CLASS__, __METHOD__, __FUNCTION__, __TRAIT__, __NAMESPACE__);

echo (isset($foo) ? $foo : 'Nope');
echo ($foo ?? 'Nope');
echo ($foo2 ?? 'Nope');
echo ($foo2 ?: 'Nope');

echo "\n";


//Namespace
include('./namespaces.php');
use foo\bar;
function foo(){
    echo "Je suis la fonction du namespace global\n";
}
foo();
foo();
var_dump(php_ini_scanned_files());



