<?php
$chaine = 'bOnJoUr, jE sUiS UnE pHrAsE pOuR tEsTeR.';

// en utilisant une expression rationnelle
echo preg_replace_callback('#(\w)(\w*)#', function($m) {
    return strtoupper($m[1]) . strtolower($m[2]);
}, $chaine);
