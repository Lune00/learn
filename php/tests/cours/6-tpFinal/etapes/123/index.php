<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Vos restaurants préférés</title>
    </head>
    <body>
        <nav>
            <a href="/index.php">Restaurants préférés</a>
            <a href="mailto:contact@restaurants-preferes.fr">Contact</a>
        </nav>
        <h1>Vos restaurants préférés</h1>
        <?php
        $chcnx = 'mysql:host=localhost;dbname=tpfinal';
        $pdo = new PDO($chcnx, 'root', '', [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $restaurants = $pdo->query('SELECT * FROM Restaurants;');
        foreach ($restaurants as $restaurant) {
            echo '<h2><a href="restaurant.php?idRestaurant=' . $restaurant['idRestaurant'] . '">' . $restaurant['nom'] . '</a></h2>';
            echo '<address>' . $restaurant['ville'] . '</address>';
            echo $restaurant['description'];
            echo '<hr>';
        }
        ?>
    </body>
</html>
