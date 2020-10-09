<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Exceptions</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Exceptions</h1>
        <h2>Levée d'une exception</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['../classes/Distance.class.php'], false, false, false, 'Le mot clé <code>throw</code> permet de lever une exception.');
        ?>

        <h2>Appel d'une méthode suceptible de lever une exception</h2>
        <?php
        afficheCode(['sansTry.php'], false, 'sansTry.php');
        ?>

        <h2>Le bloc <code>try ... catch ... finally</code></h2>
        <?php
        afficheCode(['utilisation.php'], false, 'utilisation.php', false, 'Le PHP utilise le mécamisme de traitement des exceptions avec les blocs <code>try ... catch</code> et éventuellement <code>finally</code>.');
        ?>
    </body>
</html>
