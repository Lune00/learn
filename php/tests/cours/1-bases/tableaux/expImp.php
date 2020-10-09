<?php
// Explode : 
$liste = "bleu, vert, orange, rouge, blanc";
var_dump($liste);
// Construction d'un tableau à partir d'une chaine de caractère :
$couleur = explode(", ", $liste);
var_dump($couleur);
// Transformation de mon tableau en chaine de caractère dont les mots sont séparés par un |
var_dump(implode("|", $couleur));
