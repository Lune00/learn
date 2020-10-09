<?php
namespace Modele;

class Avis extends ModeleDeDonnees {
    public function getAvis($idR) : \Traversable {
        return $this->executerRequete('SELECT * FROM Avis WHERE idRestaurant=:idR', [':idR' => $idR]);
    }
}
