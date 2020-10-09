<?php
$mail = "herve.boisgontier@eni-ecole.fr";
$position = strpos($mail, 'w');
if ($position === false) {
    echo "'w' est introuvable dans $mail<br>";
} else {
    echo "'w' est à la position $position dans $mail<br>";
}