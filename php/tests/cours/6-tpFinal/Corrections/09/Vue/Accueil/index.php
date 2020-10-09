<?php
$this->titre = 'Restaurants Préférés';
?>

<h1>Vos restaurants préférés</h1>
<?php
foreach ($restaurants as $r) :
    ?>
    <a href="index.php?ctrl=restaurant&idRestaurant=<?= $r['idRestaurant'] ?>">
        <h2><?= $r['nom'] ?></h2></a>
    <address><?= $r['ville'] ?></address>
    <?= $r['description'] ?>
    <hr>
    <?php
endforeach;
