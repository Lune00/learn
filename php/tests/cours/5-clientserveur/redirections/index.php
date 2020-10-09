<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Les redirections</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Les redirections</h1>

        <h2>Redirection vers un chemin relatif</h2>
        <?php highlight_file('redir.php'); ?>
        <a href="redir.php" class="executer">Exécuter</a>

        <h2>Redirection vers un chemin absolu</h2>
        <?php highlight_file('redirAbs.php'); ?>
        <a href="redirAbs.php" class="executer">Exécuter</a>

        <h2>Redirection vers un autre site web</h2>
        <?php highlight_file('redirExt.php'); ?>
        <a href="redirExt.php" class="executer">Exécuter</a>

        <h2>Redirection permanente</h2>
        <?php highlight_file('redirPerm.php'); ?>
        <a href="redirPerm.php" class="executer">Exécuter</a>

        <h2>Redirection conditionnelle</h2>
        <?php highlight_file('redirCond.php'); ?>
        <a href="redirCond.php" class="executer">Exécuter</a>
    </body>
</html>