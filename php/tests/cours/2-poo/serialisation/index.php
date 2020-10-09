<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>La sérialisation</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>La sérialisation</h1>

        <h2>Sérialisation d'éléments simples</h2>

        <h3>Entiers</h3>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['entiers.php'], false, 'entiers.php');
        ?>

        <h3>Booléens</h3>
        <?php afficheCode(['booleens.php'], false, 'booleens.php'); ?>

        <h3>Réels</h3>
        <?php afficheCode(['reels.php'], false, 'reels.php'); ?>

        <h3>Chaines de caractères</h3>
        <?php afficheCode(['chaines.php'], false, 'chaines.php'); ?>

        <h2>Sérialisation d'éléments complexes</h2>

        <h3>Tableaux indexés</h3>
        <?php afficheCode(['ti.php'], false, 'ti.php'); ?>

        <h3>Tableaux associatifs</h3>
        <?php afficheCode(['ta.php'], false, 'ta.php'); ?>

        <h2>Sérialisation d'instances</h2>
        <h3>Classe simple</h3>
        <?php afficheCode(['cs.php'], false, 'cs.php'); ?>

        <h3>Classe complexe</h3>
        <?php afficheCode(['cc.php'], false, 'cc.php'); ?>

        <h3>Méthodes magiques associées à la sérialisation</h3>
        <?php afficheCode(['mm.php'], false, 'mm.php'); ?>
    </body>
</html>
