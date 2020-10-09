<?php
echo '<pre style="font-family: courier">';
$personnes = array(array('Norbert', 'DURAND'), array('Melanie', 'MALALANICHE'), array('Juste', 'LE BLANC'));
foreach ($personnes as $p) {
    printf("%-20s %-20s<br>", $p[0], $p[1]);
}
echo '</pre>';
