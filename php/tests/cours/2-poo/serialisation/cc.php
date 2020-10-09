<?php
class ClasseComplexe {

    private $tab;
    private $inst;

    function __construct() {
        $this->tab = ['test' => [17, 24, 56, 'bonjour'], 'autre' => ['tutu' => 45, 23, 42]];
        $this->inst = new ClasseSimple(17, 'bonjour');
    }

}

$instance2 = new ClasseComplexe();
var_dump($instance2);
$serial = serialize($instance2);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
