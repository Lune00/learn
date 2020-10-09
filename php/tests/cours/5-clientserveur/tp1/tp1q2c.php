<?php require './tp1q2init.php'; ?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 2</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Échanges client-serveur</h1>
        <?php
        require './tp1q2e.php';
        echo '<div>';
        require './tp1q2.php';
        echo '</div>';
        require_once '../../afficheCode.php';
        afficheCode(['tp1q2init.php', 'tp1q2.php'], true, false, true, 'Il ne faut pas oublier de filtrer les données lues dans le cookie. Ces données étant stockées sur le poste du client, il est tout à fait possible que ces données aient été modifiées à des fins malveillantes.<br>Les navigateurs internet cherchent à préremplir les champs lorsqu\'un visiteur revient sur une page. Pour s\'assurer que les données maintenues le sont bien en raison du code PHP, il faut, lors du retour sur la page, la recharger avec <code>CTRL-F5</code>.<br>L\'expression rationnelle utilisée pour filtrer les champs Login et Mot de passe permet de s\'assurer qu\'il n\'y a pas de guillemets présents. Ceci serait problématique car cette valeur est utilisée pour initialiser l\'attribut value et terminerait la chaîne de caractères trop tôt.');
        ?>
    </body>
</html>