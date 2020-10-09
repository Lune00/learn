<?php
require_once './monProjet_MaClasse.class.php';

// Création d'un alias sur la classe du namespace monProjet
use monProjet\MaClasse as Mc;

$objAlias = new Mc();
echo $objAlias->mafonction();
