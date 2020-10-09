<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Suppression d'un cookie</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Suppression d'un cookie</h1>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['suppression.php'], false, 'suppression.php');
        ?>
        <a href="utilisationCookie.php" class="precedent">Page lecture d'un cookie</a>
    </body>
</html>