<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Interfaces</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Interfaces</h1>
        <h2>Définition de deux interfaces</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['../interfaces/Lecture.interface.php', '../interfaces/Ecriture.interface.php'], true, false, false, 'Utilissation du mot clé <code>interface</code> pour définir une interface<br>');
        ?>
        <h2>Définition d'une classe implémentant ces interfaces</h2>
        <?php
        afficheCode(['../classes/Valeur.class.php'], false, false, false, 'Utilisation du mot clé <code>implements</code> pour implémenter une ou plusieurs interfaces<br>');
        ?>
        <h2>Utilisation de cette classe</h2>
        <?php
        afficheCode(['utilisation.php'], false, 'utilisation.php');
        ?>
    </body>
</html>
