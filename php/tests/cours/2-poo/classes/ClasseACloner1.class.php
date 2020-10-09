<?php
class ClasseACloner1 {
    private $attribut;
    private static $instances = 0;
    private $inst;

    public function __construct() {
        static::$instances++;
        $this->attribut = "test";
        $this->inst = new ObjetCible();
    }

    public function __destruct() {
        static::$instances--;
        echo '<div><em>Suppression d\'une instance de ' . __CLASS__ . '</em></div>';
    }

    public static function afficheNbInstances() {
        echo 'il y a ' . static::$instances . ' instance' . (static::$instances > 1 ? 's' : '') . ' de la classe ' . __CLASS__ . '<br>';
    }

    public function setAttribut($valeur) {
        $this->attribut = $valeur;
    }

    public function setValInstance($v) {
        $this->inst->setVal($v);
    }
}
