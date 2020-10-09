<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 1</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Requêter une base de données</h1>
        <?php
        include 'tp1q1e.php';
        require_once '../../afficheCode.php';
        afficheCode(['tp1q1.php', 'tp1cnx.php'], true, 'tp1q1.php', true, 'Les instructions nécessaires à la connexion à la base de données ont été positionnées dans un script à part. Ceci permet de les réutiliser pour tous les autres exercices de ce TP sans avoir à les dupliquer.<br>La méthode <a href="http://php.net/manual/fr/pdo.query.php"><code>query()</code></a> exécute la requête et <a href="http://php.net/manual/fr/pdostatement.fetchall.php"><code>fetchAll()</code></a> récupère toutes les lignes obtenues et les positionne dans un tableau. La boucle <code>foreach</code> parcourt ce tableau et affiche les modèles de véhicule.');
        ?>
    </body>
</html>
