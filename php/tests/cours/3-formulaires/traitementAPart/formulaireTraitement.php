<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Formulaire traitement à part</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Formulaire traitement à part</h1>

        <h2>Les variables superglobales <a href="http://php.net/manual/fr/reserved.variables.get.php"><code>$_GET</code></a>, <a href="http://php.net/manual/fr/reserved.variables.post.php"><code>$_POST</code></a> et <a href="http://php.net/manual/fr/reserved.variables.request.php"><code>$_REQUEST</code></a></h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['getPostRequest.php'], false, 'getPostRequest.php');
        ?>

        <h2>Les méthodes <a href="http://php.net/manual/fr/function.filter-var.php"><code>filter_var</code></a> et <a href="http://php.net/manual/fr/function.filter-input.php"><code>filter_input</code></a></h2>
        <?php
        afficheCode(['filterSimple.php'], false, 'filterSimple.php');
        ?>

        <h2>Récupération de plusieurs valeurs en même temps</h2>
        <?php
        afficheCode(['filterTableauS.php'], false, 'filterTableauS.php');
        ?>

        <h2>Test de la validité des valeurs</h2>
        <h3>Du même type</h3>
        <?php
        afficheCode(['filterTableauI.php'], false, 'filterTableauI.php');
        ?>

        <h3>De types différents</h3>
        <?php
        afficheCode(['filterTableauC.php'], false, 'filterTableauC.php');
        ?>
    </body>
</html>