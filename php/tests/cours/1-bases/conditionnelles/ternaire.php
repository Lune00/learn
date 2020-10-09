<?php
$nb = 7;

echo 'il y a ' . $nb . ' élément';
if ($nb > 1)
    echo 's';
echo '<br>';

// version plus courte grâce à l'opérateur ternaire ? :
echo 'il y a ' . $nb . ' élément' . ($nb > 1 ? 's' : '') . '<br>';
