<?php
$texte = 'Fonctionnement\n\nPHP appartient à la grande famille des descendants '.
        'du C, dont la syntaxe est très proche. En particulier, sa syntaxe et '.
        'sa construction ressemblent à celles des langages Java et Perl, à '.
        'ceci près que du code PHP peut facilement être mélangé avec du code '.
        'HTML au sein d\'un fichier PHP.\nDans une utilisation destinée à '.
        'l\'internet, l\'exécution du code PHP se déroule ainsi : lorsqu\'un '.
        'visiteur demande à consulter une page de site web, son navigateur '.
        'envoie une requête au serveur HTTP correspondant. Si la page est '.
        'identifiée comme un script PHP (généralement grâce à l\'extension '.
        '.php), le serveur appelle l\'interprète PHP qui va traiter et générer '.
        'le code final de la page (constitué généralement d\'HTML ou de XHTML, '.
        'mais aussi souvent de feuilles de style en cascade et de JS). Ce '.
        'contenu est renvoyé au serveur HTTP, qui l\'envoie finalement au '.
        'client.\n\nSource : Wikipédia (https://fr.wikipedia.org/wiki/PHP)';
echo preg_replace('#\\\n#', '<br>', $texte);
