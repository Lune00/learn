<?php
require_once '../interfaces/Lecture.interface.php';
require_once '../interfaces/Ecriture.interface.php';

class Valeur implements Lecture, Ecriture {

    private $val;

    // Implémentation de la méthode de Lecture.
    public function get() {
        return $this->val;
    }

    // Implémentation de la méthode d'Ecriture.
    public function put($valeur) {
        $this->val = $valeur;
    }
}
