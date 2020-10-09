<?php
class Form {

    protected $nom;
    protected $action;
    protected $methode;
    protected $inputs;
    protected $submit;

    public function __construct($nom, $action, $methode = 'POST') {
        $this->nom = $nom;
        $this->action = $action;
        $this->methode = $methode;
    }

    public function setText($label, $valeur = '', $requis = false, $attributs = array()) {
        if (!$label) {
            throw new Exception('Le nom du champ est obligatoire', 1);
        }
        $this->inputs[] = array_merge(['type' => 'text',
                                        'name' => $label,
                                        'value' => $valeur,
                                        'requis' => $requis], $attributs);
    }

    public function setSubmit($value) {
        $this->submit = $value;
    }

    public function getForm() {
        $formulaire = '<form action="' . $this->action . '" method="' .
                $this->methode . '"><fieldset><legend>' . $this->nom . '</legend>';
        foreach ($this->inputs as $input) {
            $this->genereInput($input, $formulaire);
        }
        $formulaire .= '<input type="submit" name="' . $this->submit .
                '" value="' . $this->submit . '" ></fieldset></form>';
        return $formulaire;
    }

    protected function genereInput($input, &$formulaire) {
        $label = $input['name'];
        // mise en forme pour l'attribut name (suppresion des caractères spéciaux et troncage à 10 caractères)
        $input['name'] = substr(preg_replace('#\W#', '', ucwords(strtolower($input['name']))), 0, 10);
        // input avec un id généré à partir du nom
        $id = 'id' . $input['name'];
        $formulaire .= '<label for="' . $id . '">' . $label . ' : </label>';
        $formulaire .= '<input id="' . $id . '"';
        // gestion de l'attribut required pour rendre obligatoire la saisie
        if ($input['requis']) {
            $formulaire .= ' required';
        }
        unset($input['requis']);
        // création des attributs de la balise input
        foreach ($input as $attribut => $valeur) {
            if ($valeur) {
                $formulaire .= ' ' . $attribut . '="' . $valeur . '"';
            }
        }
        $formulaire .='><br>';
    }

}
