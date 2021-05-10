<?php

$a = array(array(1), array(2), array(3));
foreach ($a as $el) {
    //Ici on copie la valeur de l'objet
    $el = array(4);
}
var_dump($a);

?>


<?php
class Foo
{
    function __construct($bar)
    {
        $this->bar = $bar;
    }
    public $bar;
}

//Les objets sont stockés sous la forme de référence
$a = array( new Foo('toto'), new Foo('tata'));
foreach($a as $obj){
    //Quand on boucle, chaque élement de $a est copié dans $obj, et donc $obj devient une référence vers l'objet
    $obj->bar = 'uuuuu';
    // var_dump($obj);
}

var_dump($a)

?>