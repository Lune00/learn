<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Les boucles</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Les boucles</h1>

        <h2>La boucle <code>while</code></h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['while.php'], false, 'while.php');
        ?>

        <h2>La boucle <code>do while</code></h2>
        <?php afficheCode(['do.php'], false, 'do.php'); ?>

        <h2>La boucle <code>for</code></h2>
        <?php afficheCode(['for.php'], false, 'for.php'); ?>

        <h2>La boucle <code>foreach</code></h2>
        <?php afficheCode(['foreach.php'], false, 'foreach.php'); ?>
    </body>
</html>
