<?php
foreach (array('background', 'color') as $propriete) {
    if (isset($_GET[$propriete])) {
        $$propriete = filter_input(INPUT_GET, $propriete,
                FILTER_SANITIZE_SPECIAL_CHARS);
        if (!setcookie($propriete, $$propriete, time() + 60 * 24 * 3600)) {
            echo 'impossible de créer le coockie ' . $propriete . '<br>';
        }
    }
}
