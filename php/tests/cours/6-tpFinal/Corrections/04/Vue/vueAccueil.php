<?php
$titre = 'Restaurants Préférés';

ob_start();
?>
<h1>Vos restaurants préférés</h1>
<?php
foreach ($restaurants as $r) :
    ?>
    <a href="restaurant.php?idRestaurant=<?= $r['idRestaurant'] ?>">
        <h2><?= $r['nom'] ?></h2></a>
    <address><?= $r['ville'] ?></address>
    <?= $r['description'] ?>
    <hr>
    <?php
endforeach;
$contenu = ob_get_clean();

require './gabarit.php';
