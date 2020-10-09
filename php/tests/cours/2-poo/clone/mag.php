<?php
require_once '../classes/ClasseACloner2.class.php';
require_once '../classes/ObjetCible.class.php';

$a = new ClasseACloner2();

$b = clone $a;

$b->setAttribut('titi');
$b->setValInstance(45);

var_dump($a);
var_dump($b);

ClasseACloner2::afficheNbInstances();

unset($a);
unset($b);
