<?php
require_once '../classes/Animal.class.php';

class Vegetarien extends Animal {

    public function mange() {
        echo 'je mange des fruits et des légumes.<br>';
    }
}
