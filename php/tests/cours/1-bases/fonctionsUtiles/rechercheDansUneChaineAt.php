<?php
$mail = "herve.boisgontier@eni-ecole.fr";
$position = strpos($mail, '@');
if ($position === false) {
    echo "'@' est introuvable dans $mail<br>";
} else {
    echo "'@' est à la position $position dans $mail<br>";
}