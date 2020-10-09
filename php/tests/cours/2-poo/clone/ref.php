<?php
require_once '../classes/ClasseACloner1.class.php';
require_once '../classes/ObjetCible.class.php';

$a = new ClasseACloner1();

$b = $a;
$c = &$a;

$c->setAttribut('titi');

var_dump($a);
var_dump($b);
var_dump($c);

ClasseACloner1::afficheNbInstances();
