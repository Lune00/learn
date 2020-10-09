<?php
$idR = filter_input(INPUT_GET, 'idRestaurant', FILTER_VALIDATE_INT);
if (!$idR) {
    echo 'Identifiant de restaurant inexistant';
    die();
}
$chaineCnx = 'mysql:host=localhost;dbname=restaurant';
$pdo = new PDO($chaineCnx, 'root', '', [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]);

$req = $pdo->prepare('SELECT * FROM Restaurants WHERE idRestaurant=:idR');
$req->bindValue(':idR', $idR);
$req->execute();
$r = $req->fetch();
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Restaurant - <?= $r['nom'] ?></title>
    </head>
    <body>
        <nav>
            <a href="index.php">Restaurants Préférés</a>
            <a href="mailto:contact@restaurants-preferes.fr">Contact</a>
        </nav>
        <h1><?= $r['nom'] ?></h1>
        <address><?= $r['adresse'] . '<br>' . $r['cp'] . ' ' . $r['ville'] ?></address>
        <?= chunk_split(sprintf("%'.010d", $r['telephone']), 2, ' ') ?>
        <h2>Description</h2>
        <?= $r['description'] ?>
        <h2>Avis</h2>
        <?php
        $reqAvis = $pdo->prepare('SELECT * FROM Avis WHERE idRestaurant=:idR');
        $reqAvis->bindValue(':idR', $idR);
        $reqAvis->execute();
        foreach ($reqAvis as $avis) {
            $auteur = $avis['auteur'];
            if(!$auteur)
                $auteur = '<i>anonyme</i>';
            echo $auteur . ' : ';
            for($i=0; $i<$avis['note']; $i++)
                echo '<img src="Media/etoile.png" alt="*">';
            for($i=$avis['note']; $i<5; $i++)
                echo '<img src="Media/pasetoile.png" alt="">';
            echo '<p>'.$avis['commentaire'].'</p>';
        }
        ?>
    </body>
</html>
