<?php
$mail = "herve.boisgontier@eni-ecole.fr";
$position = strpos($mail, 'h');
if ($position === false) {
    echo "'h' est introuvable dans $mail<br>";
} else {
    echo "'h' est à la position $position dans $mail<br>";
}