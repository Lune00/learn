<?php
require_once '../classes/ClasseACloner1.class.php';
require_once '../classes/ObjetCible.class.php';

$a = new ClasseACloner1();

$b = clone $a;

$b->setAttribut('titi');
$b->setValInstance(45);

var_dump($a);
var_dump($b);

ClasseACloner1::afficheNbInstances();
