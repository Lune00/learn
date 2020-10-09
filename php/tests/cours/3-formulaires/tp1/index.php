<?php require_once 'tp1q6init.php'; ?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 : Formulaires</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
        <link href="calsty.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Formulaires</h1>
        <h2 class="dif2">Question 1</h2>
        <section class="enonce">Créer une page html contenant un  formulaire comprenant un groupe de champs ayant pour titre "<code>Adresse client</code>". Le groupe doit permettre la saisie du nom, du prénom, de l’adresse, de la ville et du code postal. Les données sont ensuite traitées par un fichier PHP séparé récupérant les données et les affichant dans un tableau HTML.</section>
        <a href="tp1q1c.php" class="executer">Correction</a>
        <h2 class="dif2">Question 2</h2>
        <section class="enonce">Améliorer le script précédent en vérifiant la présence des données et en affichant une boîte d’alerte JavaScript si l’une des données est manquante.</section>
        <a href="tp1q2c.php" class="executer">Correction</a>
        <h2 class="dif1">Question 3</h2>
        <section class="enonce">Créer un formulaire de saisie d’adresse e-mail contenant un champ caché destiné à récupérer le type du navigateur de l’utilisateur. Le code PHP affiche l’adresse mail et le nom du navigateur dans la même page après vérification de l’existence des données.</section>
        <a href="tp1q3c.php" class="executer">Correction</a>
        <h2 class="dif2">Question 4 :</h2>
        <section class="enonce">Créer un formulaire demandant la saisie d’un prix HT et d’un taux de TVA. 
            Le script affiche le montant de la TVA et le prix TTC dans deux zones de 
            texte créées dynamiquement. Le formulaire maintient les données saisies.</section>
        <a href="tp1q4c.php" class="executer">Correction</a>
        <h2 class="dif1">Question 5</h2>
        <section class="enonce">Dans la perspective de la création d’un site d’agence immobilière, créer un formulaire comprenant trois boutons de soumission nommés &laquo;&nbsp;Vendre&nbsp;&raquo;, &laquo;&nbsp;Acheter&nbsp;&raquo; et &laquo;&nbsp;Louer&nbsp;&raquo;. En fonction du choix effectué par le visiteur, le rediriger vers une page spécialisée correspondante.<br>Il est bien à noter que ceci est un exercice pour apprendre à maîtriser les formulaires et les redirections. Dans « la vraie vie », il serait préférable d'utiliser une balise de lien hypertexte.</section>
        <a href="tp1q5c.php" class="executer">Correction</a>
        <h2 class="dif3">Question 6</h2>
        <section class='enonce'>Créer une page PHP affichant le calendrier pour
            le mois en cours et un formulaire permettant de saisir un autre mois.
            En fonction des informations saisies, le calendrier doit se mettre à
            jour.
            Il faut respecter les règles suivantes : 
            <ul><li>Contrainte de gestion : les valeurs de mois doivent aller de
                    1 à 12 inclus, les valeurs d’années de 1970 à 2037.</li>
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
        <a href="tp1q6c.php" class="executer">Correction</a>
    </body>
</html>
