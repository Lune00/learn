<?php
require_once 'Personne.class.php';

class Client extends Personne {

    private $adresse;

    public function setCoord($adresse) {
        $this->adresse = $adresse;
    }

    public function __toString() {
        return '<address>' . $this->nom . ' ' . $this->prenom . '<br>' . $this->adresse . '</address>';
    }
}
