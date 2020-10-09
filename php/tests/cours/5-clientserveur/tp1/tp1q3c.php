<?php require './tp1q3init.php'; ?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 3</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Échanges client-serveur</h1>
        <?php
        require './tp1q3e.php';
        echo '<div>';
        require './tp1q3.php';
        echo '</div>';
        require_once '../../afficheCode.php';
        afficheCode(['tp1q3init.php', 'tp1q3.php'], true, false, true, 'La différence par rapport à l\'exercice précédent est l\'envoi d\'une requête à la base de données pour vérifier les informations saisies. La requête compte le nombre de lignes ayant cet identifiant et ce nom. Le test pour savoir si le compte existe utilise l\'opérateur <code>==</code> et non <code>===</code> car la valeur obtenue est une chaîne de caractères (<code>\'1\'</code> ou <code>\'0\'</code>).');
        ?>
    </body>
</html>