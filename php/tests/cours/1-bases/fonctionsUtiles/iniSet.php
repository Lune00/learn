<?php
phpinfo();
echo date_default_timezone_get();
echo '<p>Avant appel à ini_set() : ' . date("H:i:s") . '</p>';

ini_set('date.timezone', 'Australia/Sydney');
echo '<p>A Sydney, il est ' . date("H:i:s") . '</p>';

ini_set('date.timezone', 'Europe/Paris');
echo '<p>En France il est ' . date("H:i:s") . '</p>';

ini_set('date.timezone', 'America/Buenos_Aires');
echo '<p>En Argentine, il est ' . date("H:i:s") . '</p>';
