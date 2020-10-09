<?php
$i = 4;

echo $i;

switch ($i) {
    case 4:
        echo ' est un nombre pair et de plus';
    case 1:
    case 9:
        echo ' est un carré parfait<br>';
        break;
    case 2:
    case 6:
    case 8:
    case 10:
        echo ' est un nombre pair<br>';
        break;
    default:
        echo ' est ni pair, ni un carré parfait<br>';
        break;
}