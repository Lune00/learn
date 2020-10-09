<?php

class VilleCtr2 {

    private $nom;
    private $departement;
    
    protected static $nomLePlusLong;

    public function __construct($nom, $dept) {
        if(strlen($nom)>strlen(static::$nomLePlusLong))
            static::$nomLePlusLong = $nom;
        $this->nom = $nom;
        $this->departement = $dept;
    }

    public function __toString() {
        return 'La ville ' . $this->nom . ' est dans le département ' . $this->departement . '<br>';
    }

    public static function getNomLePlusLong() {
        return static::$nomLePlusLong;
    }
}
