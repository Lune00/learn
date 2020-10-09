<?php
require_once 'VilleCtr2.class.php';

class VilleCtrAvecRegion extends VilleCtr2 {
    private $region;
    
    public function __construct($nom, $dept, $region) {
        parent::__construct($nom, $dept);
        $this->region = $region;
    }
    
    public function __toString() {
        $recup = parent::__toString();
        $recup = substr($recup, 0, strlen($recup) - 4);
        return  $recup . ' et dans la région ' .
                $this->region . '<br>';
    }
}
