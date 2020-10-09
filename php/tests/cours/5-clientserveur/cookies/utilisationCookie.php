<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Consultation de la valeur d'un cookie</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Consultation de la valeur d'un cookie</h1>
        <h2>La variable superglobale <code><a href="http://php.net/manual/fr/reserved.variables.cookies.php">$_COOKIE</a></code></h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['dollarCookie.php'], false, 'dollarCookie.php');
        ?>
        <h2>La fonction <a href="http://php.net/manual/fr/function.filter-input.php"><code>filter_input</code></a></h2>
        <?php
        afficheCode(['filterInput.php'], false, 'filterInput.php');
        ?>
        <a href="index.php" class="precedent">Page de création des cookies</a> <a href="suppressionCookie.php" class="executer">Page suppression d'un cookie</a>
    </body>
</html>