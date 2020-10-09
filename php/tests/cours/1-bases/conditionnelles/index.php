<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Les conditionnelles</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Les conditionnelles</h1>

        <h2>La structure de contrôle <code>if</code></h2>
        <h3>Cas simple</h3>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['if.php'], false, 'if.php');
        ?>

        <h3><code>if else</code></h3>
        <?php afficheCode(['else.php'], false, 'else.php'); ?>

        <h3><code>if elseif else</code></h3>
        <?php afficheCode(['elseif.php'], false, 'elseif.php'); ?>

        <h2>L'opérateur ternaire <code>? :</code></h2>
        <?php afficheCode(['ternaire.php'], false, 'ternaire.php'); ?>

        <h2>La structure de contrôle <code>switch</code></h2>
        <h3>Cas simple</h3>
        <?php afficheCode(['switch.php'], false, 'switch.php'); ?>

        <h3>Plusieurs cas ensemble</h3>
        <?php afficheCode(['switch2.php'], false, 'switch2.php'); ?>

    </body>
</html>
