<?php
ini_set('date.timezone', 'Europe/Paris');
echo '<ul>';
for ($i = 2018; $i <= 2037; $i++) {
    $paques = easter_date($i);
    $ascention = $paques + 39 * 24 * 60 * 60;
    echo '<li>' . date('d/m/Y', $ascention) . '</li>';
}
echo '</ul>';
