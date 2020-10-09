<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Dépot d'un cookie</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Dépot d'un cookie</h1>
        <h2>Dépôt d'un cookie expirant à la fin de la session</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['cookieNom.php'], false, 'cookieNom.php');
        ?>
        <h2>Dépôt d'un cookie expirant dans 30 jours</h2>
        <?php
        afficheCode(['cookiePrenom.php'], false, 'cookiePrenom.php');
        ?>
        <a href="utilisationCookie.php" class="executer">Page lecture d'un cookie</a>
    </body>
</html>
