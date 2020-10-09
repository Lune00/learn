<?php
switch (date('N', mktime(0, 0, 0, 12, 25, 2017))) {
    case 1 : echo 'Lundi';
        break;
    case 2 : echo 'Mardi';
        break;
    case 3 : echo 'Mercredi';
        break;
    case 4 : echo 'Jeudi';
        break;
    case 5 : echo 'Vendredi';
        break;
    case 6 : echo 'Samedi';
        break;
    case 7 : echo 'Dimanche';
        break;
}
