<?php
class Vue {

    private $action;
    private $titre;

    public function __construct($action) {
        $this->action = $action;
    }

    private function insererDonnees(string $cheminFichier, $donnees): string {
        if (!file_exists($cheminFichier)) {
            throw new Exception('Le fichier n\'existe pas !');
        }
        extract($donnees);

        ob_start();
        require($cheminFichier);
        return ob_get_clean();
    }

    public function afficher($donnees) {
        $contenu =$this->insererDonnees('Vue/vue' . $this->action . '.php',
                                        $donnees);
        echo $this->insererDonnees('Vue/gabarit.php',
                            ['titre' => $this->titre, 'contenu' => $contenu]);
    }

}
