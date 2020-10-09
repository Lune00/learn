<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 4</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Formulaires</h1>
        <h2>Question 4 :</h2>
        <section class="enonce">Créer un formulaire demandant la saisie d'un prix HT et d'un taux de TVA. 
            Le script affiche le montant de la TVA et le prix TTC dans deux zones de 
            texte créées dynamiquement. Le formulaire maintient les données saisies.</section>
            <?php
            require_once '../../afficheCode.php';
            afficheCode(['tp1q4.php'], false, 'tp1q4.php', isset($_POST['Calculer'])?2:true, 'Les valeurs saisies sont filtrées pour accepter uniquement des nombres réels. Attention le filtre <a href="http://php.net/manual/fr/filter.filters.sanitize.php"><code>FILTER_SANITIZE_NUMBER_FLOAT</code></a> ne suffit pas. Pour accepter une partie décimale, il faut lui adjoindre le drapeau <a href="http://php.net/manual/fr/filter.filters.sanitize.php"><code>FILTER_FLAG_ALLOW_FRACTION</code></a>.<br>Pour maintenir les valeurs dans les champs de saisie, celles-ci sont ajoutées dans l\'attribut <code>value</code> des balises input.');
            ?>
    </body>
</html>
