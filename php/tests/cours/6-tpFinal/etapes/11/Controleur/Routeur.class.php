<?php
namespace Controleur;

require_once 'Vue/Vue.class.php';

class Routeur {

    public function router() {
        $action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
        $controleur = filter_input(INPUT_GET, 'controleur', FILTER_SANITIZE_STRING);
        try {
            if ($action == '')
                $action = 'index';
            if ($controleur == '')
                $controleur = 'Accueil';

            $nomCtrl = 'Controleur\Ctrl' . $controleur;
            $fichierCtrl = 'Controleur/Ctrl' . $controleur . '.class.php';
            if (!file_exists($fichierCtrl))
                throw new Exception('Controleur inexistant');
            $ctrl = new $nomCtrl();
            $ctrl->executerAction($action);
        } catch (PDOException $e) {
            $this->afficherErreur('Une erreur est survenue avec la base de données : ' . $e->getMessage());
        } catch (Exception $e) {
            $this->afficherErreur($e->getMessage());
        }
    }

    private function afficherErreur($message) {
        $v = new Vue('Erreur');
        $v->afficher(['message' => $message], 'index');
    }

}
