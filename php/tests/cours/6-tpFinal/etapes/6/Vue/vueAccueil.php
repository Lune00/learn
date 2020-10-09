<?php
$titre = 'Vos restaurants préférés';

ob_start();
echo '<h1>'.$titre.'</h1>';
foreach ($restaurants as $restaurant) {
    echo '<h2><a href="restaurant.php?idRestaurant=' . $restaurant['idRestaurant'] . '">' . $restaurant['nom'] . '</a></h2>';
    echo '<address>' . $restaurant['ville'] . '</address>';
    echo $restaurant['description'];
    echo '<hr>';
}
$contenu = ob_get_clean();
require 'Vue/gabarit.php';
