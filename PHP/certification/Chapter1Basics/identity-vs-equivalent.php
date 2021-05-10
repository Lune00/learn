<?php

$foo = array(
    'a' => 1,
    'b' => 2
);
$bar = array(
    'b' => '2',
    'a' => 1
);

var_dump($foo == $bar, $foo === $bar,  $foo !== $bar);
