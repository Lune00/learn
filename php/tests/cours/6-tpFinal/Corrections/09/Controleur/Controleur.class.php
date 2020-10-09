<?php

require_once './Vue/Vue.class.php';

abstract class Controleur {

    private $action;

    public function executer($action) {
        $this->action = $action;
        if (!method_exists($this, $action)) {
            throw new Exception('Action inexistante');
        }
        $parametres = $this->$action();
        $vue = new Vue(str_replace("Controleur\\Ctrl", "", get_class($this)),
                                    $action);
        $vue->afficher($parametres);
    }
    
    public abstract function index();

}
