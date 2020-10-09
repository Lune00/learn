<?php
class Chaine {

    private $x;
    
    public function getX() {
        return $this->x;
    }

    public function setX($x) {
        $this->x = $x;
    }

    function __construct($x) {
        $this->x = $x;
    }

}
