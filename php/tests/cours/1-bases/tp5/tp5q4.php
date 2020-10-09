<?php

$texte = "== Histoire ==
Le langage PHP fut créé en [[1994]] par [[Rasmus Lerdorf]] pour son
[[site web]]. C'était à l'origine une [[bibliothèque logicielle]] en
[[C (langage)|C]] dont il se servait pour conserver une trace des visiteurs qui
venaient consulter son [[Curriculum vitæ|CV]]. Au fur et à mesure qu'il ajoutait
de nouvelles fonctionnalités, Rasmus a transformé la bibliothèque en une
implémentation capable de communiquer avec des bases de données et de créer des
applications dynamiques et simples pour le [[World Wide Web|Web]]. Rasmus décida
alors en [[1995]] de publier son code, pour que tout le monde puisse l'utiliser
et en profiter. PHP s'appelait alors PHP/FI (pour
'''''P'''ersonal '''H'''ome '''Pa'''ge Tools/'''F'''orm '''I'''nterpreter'').
En [[1997]], deux étudiants, [[Andi Gutmans]] et [[Zeev Suraski]],
redéveloppèrent le cœur de PHP/FI. Ce travail aboutit un an plus tard à la
version 3 de PHP, devenu alors ''PHP: Hypertext Preprocessor''. Peu de temps
après, Andi Gutmans et Zeev Suraski commencèrent la réécriture du moteur interne
de PHP. Ce fut ce nouveau moteur, appelé ''[[Zend Engine]]'' — le mot ''Zend''
est la contraction de '''''Ze'''ev'' et ''A'''nd'''i'' — qui servit de base à
la version 4 de PHP.

=== Utilisations ===
[[Image:Server-side websites programming languages.PNG|thumb|Répartition des " .
"langages de programmation côté serveur des sites web, le 28 avril 2016.]]
En [[2002]], PHP est utilisé par plus de 8 millions de sites Web à travers le
monde, en [[2007]] par plus de 20 millions et en 2013 par plus de 244
millions.";

// conversion des gras et italiques
$texte = preg_replace('#\'\'\'([^\']+)\'\'\'#', '<b>$1</b>', $texte);
$texte = preg_replace('#\'\'([^\']+)\'\'#', '<i>$1</i>', $texte);

// conversion des titres
$texte = preg_replace_callback('#(={1,6}) (.+?) ={1,6}#', function($matches) {
    $nb = strlen($matches[1]);
    return '<h' . $nb . '>' . $matches[2] . '</h' . $nb . '>';
}, $texte);

// conversion des images
$texte = preg_replace_callback('#\[\[Image:(.+?)\|.*\]\]#', function($matches) {
    $file = str_replace(' ', '_', $matches[1]);
    return '<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/' . $file . '/220px-' . $file . '" alt="">';
}, $texte);

/* conversion des liens (version simple mais pb d'espace dans les URL)
  $texte = preg_replace('#\[\[([^\]]+?)\|([^\]]+?)\]\]#', '<a href="https://fr.wikipedia.org/wiki/$1">$2</a>', $texte);
  $texte = preg_replace('#\[\[(.+?)\]\]#', '<a href="https://fr.wikipedia.org/wiki/$1">$1</a>', $texte);
 */
// conversion des liens
$texte = preg_replace_callback('#\[\[([^\]]+?)\|([^\]]+?)\]\]#', function($m) {
    $lien = str_replace(' ', '_', $m[1]);
    return '<a href="https://fr.wikipedia.org/wiki/' . $lien . '">' . $m[2] . '</a>';
}, $texte);
$texte = preg_replace_callback('#\[\[(.+?)\]\]#', function($m) {
    $lien = str_replace(' ', '_', $m[1]);
    return '<a href="https://fr.wikipedia.org/wiki/' . $lien . '">' . $m[1] . '</a>';
}, $texte);

echo $texte;