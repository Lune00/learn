<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Dates</title>
        <link href="../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Dates</h1>
        <h2>Modification des paramètres de <code>php.ini</code> pour ce script</h2>
        <?php
        echo "<code>ini_set('date.timezone', 'Europe/Paris');</code><br>";
        ini_set('date.timezone', 'Australia/Sydney');
        echo 'A Sydney, il est ' . date("H:i:s") . '<br>';
        echo "Date au format JJ/MM/AAAA : " . date('d/m/Y') . "<br>";
        ini_set('date.timezone', 'Europe/Paris');
        echo 'En france il est ' . date("H:i:s") . '<br>';
        echo "<code>ini_set('date.timezone', 'America/Buenos_Aires');</code><br>";
        ini_set('date.timezone', 'America/Buenos_Aires');
        echo 'En Argentine, il est ' . date("H:i:s") . '<br>';
        echo "<code>ini_set('date.timezone', 'Australia/Sydney');</code><br>";
        ?>

        <h2>Les fonctions <code>date()</code> et <code>mktime()</code></h2>
        <?php
        echo "Unix a fêté sa milliardième seconde le " . date("d/m/Y H:i:s", 1000000000) . '<br>';

        // Construction d'un timestamp :
        echo '<code>mktime(11, 45, 30, 4, 1, 2017)</code> = '.mktime(11, 45, 30, 4, 1, 2017) . '<br>';
        echo '<code>date("d/m/Y H:i:s", mktime(11, 45, 30, 4, 1, 2017))</code> = ' . date("d/m/Y H:i:s", mktime(11, 45, 30, 4, 1, 2017)) . '<br>';
        ?>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>