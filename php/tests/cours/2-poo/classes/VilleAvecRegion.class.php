<?php

require_once 'Ville.class.php';

class VilleAvecRegion extends VilleCtr {
    
    private $region;
    
    public function __construct($nom, $dept, $region) {
        /*parent::setNom($nom);
        parent::setDepartement($dept);*/
     parent::__construct($nom, $dept);
        $this->region = $region;
    }
    
    public function __toString() {
        $recup = parent::__toString();
        $recup = substr($recup, 0, strlen($recup) - 4);
        return  $recup . ' de la région ' .
                $this->region . '<br>';
    }
}
