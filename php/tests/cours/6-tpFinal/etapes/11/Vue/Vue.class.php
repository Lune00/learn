<?php
namespace Vue;

class Vue {
    
    private $action;
    private $titre;

    public function __construct($action) {
        $this->action = $action;
    }

    private function insererDonnees(string $fichier, array $donnees) {
        if(!file_exists($fichier))
            throw new \Exception ('Le fichier '.$fichier.' n\'existe pas !');
        foreach ($donnees as $nom => $valeur) {
            $$nom = $valeur;
        }
        ob_start();
        require $fichier;
        return ob_get_clean();
    }
    
    public function afficher($donnees, $mth) {
        $contenu = $this->insererDonnees('Vue/'.$this->action.'/'.$mth.'.php', $donnees);
        echo $this->insererDonnees('Vue/gabarit.php', ['titre'=> $this->titre, 'contenu' => $contenu]);
    }
}
