<?php
require_once 'Utilisateur.class.php';

class UtilisateurAvecMatricule extends Utilisateur {
    private static $nbUtilisateursAvecMatricule = 0;
    
    private $numeroMatricule;
    
    public function __construct($prenom, $nom) {
        parent::__construct($prenom, $nom);
        static::$nbUtilisateursAvecMatricule++;
        $this->numeroMatricule = static::$nbUtilisateursAvecMatricule;
    }
    
    public function informations() {
        return parent::informations() . 'Numéro de matricule : ' . $this->numeroMatricule . '<br>';
    }
    
    public static function nombreDEmpoyesAvecMatricule() {
        return static::$nbUtilisateursAvecMatricule;
    }
}
