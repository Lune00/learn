<?php
// Définir une constante (dont le nom est par défaut sensible à la casse) : 
define('CONSTANTE', 'php en version ' . phpversion());
// Utilisation du mot-clé const (depuis la version 5.3)
const UNE_AUTRE_CONSTANTE = 'PHP 7';

// Afficher la valeur de CONSTANTE (=> OK).
echo '<code>CONSTANTE</code> = ' . CONSTANTE . '<br>';
echo '<code>UNE_AUTRE_CONSTANTE</code> = ' . UNE_AUTRE_CONSTANTE . '<br>';

// Afficher la valeur de constante (=> inexistante)
echo '<p><code>constante</code> = ' . constante . ' => interpr&eacute;t&eacute; en litt&eacute;ral<br>';

var_dump(defined('UNE_AUTRE_CONSTANTE'));

var_dump(defined('CONSTANTE'));
