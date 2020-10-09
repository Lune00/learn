<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Chargement automatique des classes</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Chargement automatique des classes</h1>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['autoLoad.php', '../classes/Chaine.class.php', 'utilisation.php'], true, 'utilisation.php', false, 'la méthode <a href="http://php.net/manual/fr/function.spl-autoload-register.php"><code>spl_autoload_register()</code></a> permet d\'enregistrer la méthode à appeler automatiquement lorsqu\'une classe non chargée en mémoire est utilisée.');
        ?>
    </body>
</html>