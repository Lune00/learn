<?php

class VilleCtr {

    private $nom;
    private $departement;

    public function __construct($nom, $dept) {
        $this->nom = $nom;
        $this->departement = $dept;
    }

    public function __toString() {
        return 'La ville ' . $this->nom . ' est dans le département ' . $this->departement . '<br>';
    }
}
