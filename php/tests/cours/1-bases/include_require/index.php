<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Inclusion de fichier</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Inclusion de fichiers</h1>
        <h2><code>include</code></h2>
        <h3><code>include</code> d'un fichier qui existe</h3>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['identite.php', 'include.php'], true, 'include.php');
        ?>
        <h3><code>include</code> d'un fichier qui n'existe pas</h3>
        <?php
        afficheCode(['include2.php'], true, 'include2.php');
        ?>
        <h2><code>require</code></h2>
        <h3><code>require</code> d'un fichier qui existe</h3>
        <?php
        afficheCode(['identite.php', 'require.php'], true, 'require.php');
        ?>
        <h3><code>require</code> d'un fichier qui n'existe pas</h3>
        <?php
        afficheCode(['require2.php'], true, /*'require2.php'*/false, false, 'L\'exécution provoque une erreur fatale !');
        ?>
        <h2><code>require_once</code> et <code>include_once</code></h2>
        <h3><code>require</code> plusieurs fois le même fichier</h3>
        <?php
        afficheCode(['identiteConst.php', 'require3.php'], true, 'require3.php');
        ?>
        <h3><code>require_once</code> plusieurs fois le même fichier</h3>
        <?php
        afficheCode(['identiteConst.php', 'require_once.php'], true, 'require_once.php');
        ?>
    </body>
</html>
