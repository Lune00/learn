<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 2</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Formulaires</h1>
        <h2>Question 2</h2>
        <section class="enonce">Améliorer le script précédent en vérifiant la présence des données et en affichant une boîte d'alerte JavaScript si l'une des données est manquante.</section>
            <?php
            require_once '../../afficheCode.php';
            afficheCode(['tp1q2.js', 'tp1q2.php', 'tp1q1.php'], true, 'tp1q2.php', true, 'Le script JS recherche toutes les balises input ayant un attribut <code>required</code>. Lorsque l\'un de ceux-ci perd le focus, il vérifie que le champ est bien complété.');
            ?>
    </body>
</html>
