<?php require_once 'tp1q6init.php'; ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 6</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
        <link href="calsty.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Formulaires</h1>
        <h2>Question 6</h2>
        <section class='enonce'>Créer une page PHP affichant le calendrier pour
            le mois en cours et un formulaire permettant de saisir un autre mois.
            En fonction des informations saisies, le calendrier doit se mettre à
            jour.
            Il faut respecter les règles suivantes : 
            <ul><li>Contrainte de gestion : les valeurs de mois doivent aller de
                    1 à 12 inclus, les valeurs d'années de 1970 à 2037.</li>
                <li>Contrainte de réalisation : le contenu des listes doit être
                    généré par du code PHP et non codé directement en HTML.</li>
            </ul>
            Voici le résultat attendu :
        </section>
        <div>
            <form method="GET" action="#">
                <fieldset>
                    <legend>Choix du mois</legend>
                    <label for="mois">Mois : </label>
                    <select id="mois" name="mois">
                        <?php
                        for ($i = 1; $i <= 12; $i++) {
                            echo '<option value="' . $i . '"';
                            if ($i == $m)
                                echo ' selected';
                            echo '>' . nomMois($i) . '</option>' . "\n";
                        }
                        ?>
                    </select><br>
                    <label for="annee">Année : </label>
                    <input type="number" min="1970" max="2037" id="annee" name="annee" value="<?= $a ?>"><br>
                    <input type="submit" name="Ok" value="Ok">
                </fieldset>
            </form>
            <?php
            if ($a && $m) {
                afficheCalendrier($a, $m);
            }
            ?>
        </div>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['tp1q6init.php', 'tp1q6c.php', 'fctCalendrier.php', 'calsty.css'], true, false, true, 'Au début du chargement de la page, un test est effectué pour savoir si un mois et une année ont été postés par le formulaire. Si c\'est le cas, les valeurs sont filtrées et enregistrées dans des variables. Dans le cas contraire, les variables sont initialisées à partir de la date actuelle.<br>Deux fonctions ont été déclarées. La première permet d\'obtenir le nom d\'un mois à partir de son numéro et la seconde permet d\'afficher un calendrier à partir d\'un mois et d\'une année passés en paramètre. Pour plus d\'informations sur l\'affichage du calendrier, se reporter à l\'exercice 8 du <a href="../../1-bases/tp3/index.php">TP 3 du module 1</a>.<br>Pour maintenir une valeur sélectionnée dans une balise <code>select</code>, il faut ajouter l\'attribut <code>selected</code> dans la balise <code>option</code> voulue.');
        ?>
    </body>
</html>
