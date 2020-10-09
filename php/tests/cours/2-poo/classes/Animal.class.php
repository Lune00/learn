<?php
abstract class Animal {

    private $espece;

    public function __toString() {
        return 'je suis un ' . $this->espece . '.<br>';
    }

    public function __construct($espece) {
        $this->espece = $espece;
    }

    public abstract function mange();
}
