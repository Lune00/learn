<?php
require_once 'Personne.class.php';

class Electeur extends Personne {

    private $bureau_de_vote;
    private $vote;

    public function aVote() {
        $this->vote = true;
    }

    public function __construct($nom, $prenom, $numBureau) {
        parent::__construct($nom, $prenom);
        $this->bureau_de_vote = $numBureau;
        $this->vote = false;
    }

    public function __toString() {
        return $this->nom . ' ' . $this->prenom .
                ' (Bureau n°' . $this->bureau_de_vote . ') ' .
                ($this->vote ? 'a déjà' : 'n\'a pas') . ' voté<br>';
    }

}
