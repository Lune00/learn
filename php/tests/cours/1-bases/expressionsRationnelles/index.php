<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Expressions rationnelles</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Expressions rationnelles</h1>
        <h2>Fonction <code>preg_match()</code></h2>
        <p>Vérification qu'une chaine à une structure conforme à celle d'une date en français [J]J/[M]M/AAAA et récupération les 3 composants : jour, mois, année.</p>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['testDates.php'], false, 'testDates.php')
        ?>

        <h2>Fonction <code>preg_replace()</code></h2>
        <p>Réorganisation d'une chaine de caractère avec preg_replace du format JJ/MM/AAAA vers le format AAAA-MM-JJ</p>
        <?php
        afficheCode(['transformeDate.php'], false, 'transformeDate.php');
        ?>
    </body>
</html>
