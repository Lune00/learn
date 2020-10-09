<?php
$nb[] = 'zero';
$nb[] = 'un';
$nb[5] = 'cinq';
$nb[] = 'six'; // prend l'indice suivant du du plus grand indice entier donné donc 6
$nb['un'] = 1;
$nb[] = 'sept'; // prend l'indice suivant du plus grand indice entier donné donc 7
$nb[-1] = 'moins un';
$nb[1.5] = 'réel'; // un tableau ne peut être indicé par un nombre réel
// la valeur est donc convertie implicitement en un nombre entier -> 1
// la case d'indice 1 étant déjà occupée, elle va être écrasée par la nouvelle valeur  !
var_dump($nb);
