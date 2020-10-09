<?php

namespace Controleur;

class Routeur {

    public function router() {
        try {
            $ctrl = filter_input(INPUT_GET, 'ctrl', FILTER_SANITIZE_STRING, ['options' => ['default' => 'Accueil']]);
            $action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING, ['options' => ['default' => 'index']]);

            $nomClasseCtrl = 'Ctrl' . $ctrl;
            $fichierCtrl = './Controleur/' . $nomClasseCtrl . '.class.php';
            if (!file_exists($fichierCtrl)) {
                throw new \Exception('Controleur inexistant');
            }
            $nomClasseCtrl = 'Controleur\\'.$nomClasseCtrl;
            if (!class_exists($nomClasseCtrl)) {
                throw new \Exception('Classe inexistante');
            }
            $instCtrl = new $nomClasseCtrl();
            
            $instCtrl->executer($action);
        } catch (\PDOException $e) {
            $this->afficherErreur('L\'accès aux données a échoué (code : ' . $e->getCode() . ')');
        } catch (\Exception $e) {
            $this->afficherErreur($e->getMessage());
        }
    }

    private function afficherErreur($msgErreur) {
        $vue = new \Vue\Vue('Erreur', 'index');
        $vue->afficher(['msgErreur' => $msgErreur]);
    }

}
