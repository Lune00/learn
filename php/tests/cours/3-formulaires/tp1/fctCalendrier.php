<?php
define('UN_JOUR', 60 * 60 * 24);

function nomMois($mois) {
    switch ($mois) {
        case 1: return 'Janvier';
        case 2: return 'Février';
        case 3: return 'Mars';
        case 4: return 'Avril';
        case 5: return 'Mai';
        case 6: return 'Juin';
        case 7: return 'Juillet';
        case 8: return 'Août';
        case 9: return 'Septembre';
        case 10: return 'Octobre';
        case 11: return 'Novembre';
        case 12: return 'Décembre';
    }
}

function afficheCalendrier($annee, $mois) {
    echo '<p><table><tr><th colspan="7">';
    echo nomMois($mois);
    echo ' ' . $annee . '</th></tr><tr><th>L</th><th>M</th><th>M</th><th>J</th><th>V</th><th>S</th><th>D</th></tr><tr>';
    $jour = mktime(0, 0, 0, $mois, 1, $annee);
    for ($i = 1; $i < date('N', $jour); $i++) {
        echo '<td></td>';
    }
    $nbJoursDansLeMois = date('t', $jour);
    for ($i = 1; $i <= $nbJoursDansLeMois; $i++) {
        echo '<td>' . date('j', $jour) . '</td>';
        if (date('N', $jour) == 7 && $i != $nbJoursDansLeMois) {
            echo '</tr><tr>';
        }
        $jour+=UN_JOUR;
    }
    $jour-=UN_JOUR;
    for ($i = date('N', $jour); $i < 7; $i++) {
        echo '<td></td>';
    }
    echo '</tr></table></p>';
}
