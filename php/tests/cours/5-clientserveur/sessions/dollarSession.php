<?php
if (isset($_SESSION['nom'])) {
    echo '<p>$_SESSION[\'nom\'] = ' . $_SESSION['nom'] . '</p>';
} else {
    echo '<p>Pas de valeur pour "nom" dans la session</p>';
}
if (isset($_SESSION['prenoms'])) {
    echo '<p>Prénoms : ' . implode(', ', $_SESSION['prenoms']) . '</p>';
} else {
    echo '<p>Pas de valeur pour "prenoms" dans la session</p>';
}
