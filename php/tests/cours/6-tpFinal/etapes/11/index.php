<?php
function chargerClasse($nomClasse) {
    require_once str_replace('\\', '/', $nomClasse) . '.class.php';
}
spl_autoload_register('chargerClasse');

$r = new Controleur\Routeur();
$r->router();
