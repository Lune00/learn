<?php

//Sanitize input : processus d'inspection
//Utiliser fonctions natives si possibles, les regex ensuite (mais seulement pour valider, pas pour modifier l'input)

$clean = array();

switch ($_POST['color']) {
    case 'red':
    case 'green':
    case 'blue':
        $clean['color'] = $_POST['color'];
        break;
    default:
        $clean['error'] = 'La couleur est invalide';
}


if (isset($clean['error'])) {
    echo $clean['error'];
    return;
}


//Process and Escape output
$html = array();
$html['color'] = htmlentities($clean['color'], ENT_QUOTES, 'UTF-8');

echo "Vous avez choisi la couleur {$clean['color']}";
