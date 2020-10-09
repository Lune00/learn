<?php
echo '<table><tr><th colspan="7">';
switch (date('n')) {
    case 1: echo 'Janvier';
        break;
    case 2: echo 'Février';
        break;
    case 3: echo 'Mars';
        break;
    case 4: echo 'Avril';
        break;
    case 5: echo 'Mai';
        break;
    case 6: echo 'Juin';
        break;
    case 7: echo 'Juillet';
        break;
    case 8: echo 'Août';
        break;
    case 9: echo 'Septembre';
        break;
    case 10: echo 'Octobre';
        break;
    case 11: echo 'Novembre';
        break;
    case 12: echo 'Décembre';
        break;
}
echo ' ' . date('Y') . '</th></tr><tr><th>L</th><th>M</th><th>M</th><th>J</th><th>V</th><th>S</th><th>D</th></tr><tr>';
$donnees = mktime(0, 0, 0, date('n'), 1);
for ($i = 1; $i < date('N', $donnees); $i++) {
    echo '<td></td>';
}
for ($i = 1; $i <= date('t'); $i++) {
    echo '<td>' . $i . '</td>';
    if (date('N', $donnees) == 7) {
        echo '</tr><tr>';
    }
    $donnees += 60 * 60 * 24;
}
for ($i = date('N', $donnees); $i <= 7; $i++) {
    echo '<td></td>';
}
echo '</tr></table>';
