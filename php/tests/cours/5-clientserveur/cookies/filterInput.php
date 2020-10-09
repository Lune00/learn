<?php
$prenom = filter_input(INPUT_COOKIE, 'prenom', FILTER_SANITIZE_STRING);
if($prenom) {
    echo '<p><code>$prenom = </code>' . $prenom . '</p>';
} else {
    echo '<p>Pas de cookie "prenom"</p>';
}

$nom = filter_input(INPUT_COOKIE, 'nom', FILTER_SANITIZE_STRING);
if($nom) {
    echo '<p><code>$nom = </code>' . $nom . '</p>';
} else {
    echo '<p>Pas de cookie "nom"</p>';
}
