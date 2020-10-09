<?php
echo '<ul>';
for ($i = 2018; $i <= 2037; $i++) {
    echo '<li> ' . $i . ' : ';
    switch (date('N', mktime(0, 0, 0, 5, 1, $i))) {
        case 1 :
        case 5 :
            echo 'Week-end prolongé !';
            break;
        case 6 :
        case 7 :
            echo 'Désolé !';
            break;
        default :
            echo 'En semaine';
            break;
    }
    echo '</li>';
}
echo '</ul>';
