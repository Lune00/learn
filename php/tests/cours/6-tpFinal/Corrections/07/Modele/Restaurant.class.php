<?php

require_once './Modele/ModeleDeDonnees.class.php';

class Restaurant extends ModeleDeDonnees {

    function getRestaurants() : Traversable {
        $reqRest = 'SELECT idRestaurant, nom, ville, description '
                . 'FROM Restaurants;';
        return $this->executerRequete($reqRest);
    }

    function getRestaurant($idRestaurant) : array {
        $reqRest = 'SELECT nom, adresse, cp, ville, telephone, description '
                . 'FROM Restaurants WHERE idRestaurant=:idRestaurant;';
        $prep = $this->executerRequete($reqRest,
                [':idRestaurant' => $idRestaurant]);
        if($prep->rowCount() === 0) {
            throw new Exception('Ce restaurant n\'existe pas');
        }
        return $prep->fetch();
    }

}
