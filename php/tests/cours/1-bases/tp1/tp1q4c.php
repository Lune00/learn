<?php
$X = "PHP7";
echo '<p><code>$X</code> :</p>';
var_dump($X);
$A = &$X;
echo '<p><code>$A</code> :</p>';
var_dump($A);
$Y = " 7 eme version de PHP";
echo '<p><code>$Y</code> :</p>';
var_dump($Y);
$Z = $Y * 10;
echo '<p><code>$Z</code> :</p>';
var_dump($Z);
$X = $Y * $Y;
echo '<p><code>$X</code> :</p>';
var_dump($X);
