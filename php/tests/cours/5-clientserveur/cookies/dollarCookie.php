<?php
if (isset($_COOKIE['prenom'])) {
    echo '<p><code>$_COOKIE[\'prenom\'] = </code>' . $_COOKIE['prenom'] . '</p>';
} else {
    echo '<p>Pas de cookie "prenom"</p>';
}
if (isset($_COOKIE['nom'])) {
    echo '<p><code>$_COOKIE[\'nom\'] = </code>' . $_COOKIE['nom'] . '</p>';
} else {
    echo '<p>Pas de cookie "nom"</p>';
}
