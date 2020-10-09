<?php
require_once 'Modele/modeleRestaurant.php';
$restaurants = getRestaurants();
require 'Vue/vueAccueil.php';
