<?php

class FormSimple {

    protected $formulaire;

    public function __construct($nom, $action, $methode = 'POST') {
        $this->formulaire = '<form action="' . $action . '" method="' .
                $methode . '"><fieldset><legend>' . $nom . '</legend>';
    }

    public function setText($label, $nom) {
        $this->formulaire .= '<label for="' . $nom . '">' . $label . ' : </label>';
        $this->formulaire .= '<input id="' . $nom . '" name="' . $nom . '"><br>';
    }

    public function setSubmit($nom) {
        $this->formulaire .= '<input type="submit" name="' . $nom . '" value="' . $nom . '">';
    }
    
    public function getForm() {
        return $this->formulaire . '</fieldset></form>';
    }
}
