<?php
$i = 7;

// forme bloque
switch ($i) {
    case 1:
        echo 'un<br>';
        break;
    case 2:
        echo 'deux<br>';
        break;
    case 3:
        echo 'trois<br>';
        break;
    default:
        echo 'ni un, ni deux, ni trois<br>';
        break;
}

// forme alternative
switch ($i):
    case 1:
        echo 'un<br>';
        break;
    case 2:
        echo 'deux<br>';
        break;
    case 3:
        echo 'trois<br>';
        break;
    default:
        echo 'ni un, ni deux, ni trois<br>';
        break;
endswitch;
