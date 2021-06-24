<?php 

//Renvoie le chemin absolu du fichier courant
echo '__FILE__ = ' .__FILE__;

echo "\n";

//Renvoie le chemin absolu du dossier contenant le fichier
echo '__DIR__ = ' .__DIR__;

echo "\n";

//Renvoie le chemin du dossier parent (1er niveau par défaut)
echo "dirname(__DIR__ . '/') = " . dirname(__DIR__);

echo "\n";

//Renvoie le chemin du dossier parent avec un niveau
echo " dirname(__DIR__, 2) = " . dirname(__DIR__, 2);

echo "\n";


?>
