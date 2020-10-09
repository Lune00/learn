<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Foreach sur les attributs d'une classe</title></head>
    <body>
        <?php

        class MaClasse {

            public $att1 = 'Attribut public 1';
            public $att2 = 'Attribut public 2';
            protected $att3 = 'attribut protégé 3';
            protected $att4 = 'attribut protégé 4';
            private $att5 = 'attribut privé 5';
            private $att6 = 'attribut privé 6';

            function listerAttributs() {
                foreach ($this as $attribut => $valeur) {
                    echo '<strong>', $attribut, '</strong> => ', $valeur, '<br />';
                }
            }

        }

        echo "Liste des attributs depuis l'exterieur de la classe<br />";
        $classe = new MaClasse();
        foreach ($classe as $attribut => $valeur)
            echo '<strong>', $attribut, '</strong> => ', $valeur, '<br />';

        echo "Liste des attributs depuis la classe<br />";
        $classe->listerAttributs();

        class Enfant extends MaClasse {

            function listerAttributs() {
//        foreach ($this as $attribut => $valeur) {
//            echo '<strong>', $attribut, '</strong> => ', $valeur, '<br />';
//        }
                parent::listerAttributs();
            }

        }

        echo "Liste des attributs depuis la classe dérivée<br />";
        $fille = new Enfant();
        $fille->listerAttributs();

        $fille->att1 = 21;
        echo "Nouvelle valeur pour \$fille->att1 : $fille->att1<br />";
        var_dump($fille);

//$fille->att3 = 22;
//echo "Nouvelle valeur pour \$fille->att3 : $fille->att3<br />";
//var_dump($fille);

        $fille->att7 = 23;
        echo "Nouvelle valeur pour \$fille->att7 : $fille->att7<br />";
        var_dump($fille);

        $fille->listerAttributs();
        ?>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>