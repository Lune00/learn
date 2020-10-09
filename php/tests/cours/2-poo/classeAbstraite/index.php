<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Classes abstraites</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Classes abstraites</h1>
        <h2>Définition de méthodes et de classes abstraites</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['../classes/Animal.class.php', '../classes/Vegetarien.class.php', '../classes/Carnivore.class.php'], true, false, false, 'Utilissation du mot clé <code>abstract</code> pour définir une classe ou une méthode abstraite<br>');
        ?>

        <h2>Utilisation</h2>
        <?php afficheCode(['utilisation.php'], FALSE, 'utilisation.php') ?>
    </body>
</html>