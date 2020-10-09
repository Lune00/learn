<?php

abstract class Controleur {

    public function executerAction($action) {
        if (!method_exists($this, $action))
            throw new Exception('Action inexistante');
        $donnees = $this->$action();
        $nomVue = str_replace('Ctrl', '', get_class($this));
        $vue = new Vue($nomVue);
        $vue->afficher($donnees, $action);
    }

    public abstract function index();
}
