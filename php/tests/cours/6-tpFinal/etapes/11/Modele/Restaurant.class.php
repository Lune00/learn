<?php
namespace Modele;

class Restaurant extends ModeleDeDonnees {
    public function getRestaurants() : \Traversable {
        return $this->executerRequete('SELECT * FROM Restaurants;');
    }
    
    public function getRestaurant($idR) {
        return $this->executerRequete('SELECT * FROM Restaurants WHERE idRestaurant=:idR', [':idR' => $idR])->fetch();
    }
}
