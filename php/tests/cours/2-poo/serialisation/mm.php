<?php
class ClasseAvecCallback {

    private $att1;
    private $att2;
    private $att;

    function __construct() {
        $this->att1 = 'a';
        $this->att2 = mt_rand(1, 24);
        $this->att = "construction";
    }

    function __sleep() {
        $this->att2 += 5;
        $this->att2 *= 25;
        return array('att1', 'att2');
    }

    function __wakeup() {
        $this->att = "delinéarisation";
        $this->att2 /= 25;
        $this->att2 -= 5;
    }

}

$instance2 = new ClasseAvecCallback();
var_dump($instance2);
$serial = serialize($instance2);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
