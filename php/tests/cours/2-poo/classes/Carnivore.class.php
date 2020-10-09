<?php
require_once '../classes/Animal.class.php';

class Carnivore extends Animal {

    public function mange() {
        echo 'je mange de la viande.<br>';
    }
}
