<?php
class ClasseSimple {

    private $entier;
    private $chaine;

    public function __construct($a, $b) {
        $this->entier = $a;
        $this->chaine = $b;
    }

    public function __toString() {
        return 'Je suis une instance de la classe "ClasseSimple" et ' .
                'j\'ai comme attributs "$entier" qui vaut "' .
                $this->entier . '" et "$chaine" qui vaut "' . $this->chaine . '"<br>';
    }

}

$instance1 = new ClasseSimple(17, 'bonjour');
echo $instance1;
$serial = serialize($instance1);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
echo unserialize($serial);
