<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Les namespaces</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Les namespaces</h1>
        <h2>Déclaration d'espaces de nom</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['monProjet_MaClasse.class.php', 'maLibrairieSpecifique_MaClasse.class.php'], true);
        ?>
        <h2>Utilisation de classes provenant de différents espaces de nom</h2>
        <?php
        afficheCode(['utilisation.php'], false, 'utilisation.php');
        ?>
        <h2>Utilisation d'alias</h2>
        <?php
        afficheCode(['alias.php'], false, 'alias.php');
        ?>
    </body>
</html>
