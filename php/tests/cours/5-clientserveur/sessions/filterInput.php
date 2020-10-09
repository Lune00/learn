<?php
$nom = filter_input(INPUT_SESSION, 'nom', FILTER_SANITIZE_STRING);
if($nom) {
    echo '<p><code>$nom = </code>' . $nom . '</p>';
} else {
    echo '<p>Pas de valeur "nom" dans la session</p>';
}
