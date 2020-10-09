<?php
require_once 'Utilisateur.class.php';

// Définition d'une classe qui hérite de la classe Utilisateur
class UtilisateurAvecCouleurs extends Utilisateur {

    // Définition des attributs complémentaires.
    private $couleurs; // couleurs préférées de l'utilisateur

    // Définition des méthodes complémentaires
    // - méthode constructeur

    public function __construct($prenom, $nom, $couleurs) {
        // Appel au constructeur de la classe parent
        // pour la première partie de l'initialisation.
        parent::__construct($prenom, $nom);
        // Initialisation spécifique complémentaire.
        $this->couleurs = explode(',', $couleurs);
    }

    // - liste des couleurs préférées de l’utilisateur
    public function couleurs() {
        return implode('-', $this->couleurs);
    }

    // - redéfinition de méthodes existantes
    public function informations() {
        return parent::informations() . 'Couleurs : ' . $this->couleurs() . '<br>';
    }
}
