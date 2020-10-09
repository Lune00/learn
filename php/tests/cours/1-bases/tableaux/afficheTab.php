<?php

function afficheTab($tab, $indices = 'indices', $titre = true) {
    if ($titre)
        echo '<h4>Tableau réalisé</h4>';
    echo '<div><table><thead><tr><th>' . $indices . '</th><th>valeurs</th></tr></thead><tbody>';
    foreach ($tab as $in => $val) {
        echo '<tr><td>' . $in . '</td><td>';
        if (is_array($val))
            afficheTab($val, $indices, false);
        else
            echo $val;
        echo '</td></tr>';
    }
    echo '</tbody></table></div>';
}
