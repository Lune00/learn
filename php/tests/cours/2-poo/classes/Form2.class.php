<?php
require_once 'Form.class.php';

class Form2 extends Form {

    public function setCheckBox($label, $coche = false, $requis = false, $attributs = array()) {
        if (!$label) {
            throw new Exception('Le nom du champ est obligatoire', 1);
        }
        $this->inputs[] = array_merge(array('type' => 'checkbox', 'name' => $label, 'coche' => $coche,
                                    'requis' => $requis), $attributs);
    }

    public function setRadioButton($label, $groupe, $coche = false, $requis = false, $attributs = array()) {
        if (!$label) {
            throw new Exception('Le nom du champ est obligatoire', 1);
        }
        if (!$groupe) {
            throw new Exception('Le nom du groupe est obligatoire', 1);
        }
        $this->inputs[] = array_merge(array('type' => 'radio', 'groupe' => $groupe, 'name' => $label,
                                    'coche' => $coche, 'requis' => $requis), $attributs);
    }

    // +
    public function setInput($type, $label, $requis = false, $attributs = array()) {
        if (!$type) {
            throw new Exception('Le type du champ est obligatoire', 1);
        }
        if (!$label) {
            throw new Exception('Le nom du champ est obligatoire', 1);
        }
        $this->inputs[] = array_merge(array('type' => $type, 'name' => $label, 'requis' => $requis), $attributs);
    }

    protected function genereInput($input, &$formulaire) {
        $label = $input['name'];
        // mise en forme pour l'attribut name (suppresion des caractères spéciaux et troncage à 10 caractères)
        $input['name'] = substr(preg_replace('#\W#', '', ucwords(strtolower($input['name']))), 0, 10);
        // input avec un id généré à partir du nom
        $id = 'id' . $input['name'];
        // Les boutons radio doivent avoir le même nom au sein d'un groupe
        if (isset($input['groupe'])) {
            if (!isset($input['value'])) {
                $input['value'] = $input['name'];
            }
            $input['name'] = $input['groupe'];
            unset($input['groupe']);
        }
        // label en premier sauf pour les checkbox, les radiobuttons et les champs cachés
        if ($input['type'] !== 'checkbox' && $input['type'] !== 'radio' && $input['type'] !== 'hidden') {
            $formulaire .= '<label for="' . $id . '">' . $label . ' : </label>';
        }
        $formulaire .= '<input id="' . $id . '"';
        // gestion de l'attribut required pour rendre obligatoire la saisie
        if ($input['requis']) {
            $formulaire .= ' required';
        }
        unset($input['requis']);
        // gestion de l'attribut checked pour les cases déjà cochées
        if (isset($input['coche'])) {
            if ($input['coche']) {
                $formulaire .= ' checked';
            }
            unset($input['coche']);
        }
        // création des attributs de la balise input
        foreach ($input as $attribut => $valeur) {
            if ($valeur) {
                $formulaire .= ' ' . $attribut . '="' . $valeur . '"';
            }
        }
        $formulaire .='>';
        // label après pour les checkbox et les radiobuttons
        if ($input['type'] === 'checkbox' || $input['type'] === 'radio') {
            $formulaire .= '<label for="' . $id . '"> ' . $label . '</label>';
        }
        if ($input['type'] !== 'hidden')
            $formulaire .='<br>';
    }

}
