<?php
class Ville {
    private $nom;
    private $departement;
    
    public function setNom($nom) {
        $this->nom = $nom;
    }

    public function setDepartement($dept) {
        $this->departement = $dept;
    }

    public function __toString() {
        return 'La ville ' . $this->nom . ' est dans le département ' . $this->departement . '<br>';
    }
}
