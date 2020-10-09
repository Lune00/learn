<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Restaurants</title>
    </head>
    <body>
        <nav>
            <a href="index.php">Restaurants Préférés</a>
            <a href="mailto:contact@restaurants-preferes.fr">Contact</a>
        </nav>
        <h1>Vos restaurants préférés</h1>
        <?php
        $chaineCnx = 'mysql:host=localhost;dbname=restaurant';
        $pdo = new PDO($chaineCnx, 'root', '',
                [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]);

        $reqRest =
               'SELECT idRestaurant, nom, ville, description FROM Restaurants;';
        $restaurants = $pdo->query($reqRest);

        foreach ($restaurants as $r) :
            ?>
            <a href="restaurant.php?idRestaurant=<?= $r['idRestaurant'] ?>">
                <h2><?= $r['nom'] ?></h2></a>
            <address><?= $r['ville'] ?></address>
            <?= $r['description'] ?>
            <hr>
            <?php
        endforeach;
        ?>
    </body>
</html>
