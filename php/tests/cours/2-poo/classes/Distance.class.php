<?php
class Distance {

    private $dist;

    public function __construct($dist) {
        if ($dist >= 0) {
            $this->dist = $dist;
        } else {
            throw new Exception('Une distance ne peut pas être négative !', 123);
        }
    }
}
