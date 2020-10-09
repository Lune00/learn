<?php

namespace Modele;

class Avis extends ModeleDeDonnees {

    function getAvis($idRestaurant) : \Traversable {
        $reqAvis = 'SELECT auteur, note, commentaire FROM avis WHERE idRestaurant=:idRestaurant;';
        return $this->executerRequete($reqAvis, [':idRestaurant' => $idRestaurant]);
    }

}
