<?php
echo '<p><code>mktime(0, 0, 0, 1, 1, 1970)</code> = ' . mktime(0, 0, 0, 1, 1, 1970) . '</p>';

echo '<p>Création du timestamp pour le 4 octobre 2017 à 11h45 et 30 secondes<br>';
echo '<code>mktime(11, 45, 30, 4, 10, 2017)</code> = ' . mktime(11, 45, 30, 4, 10, 2017) . '</p>';

echo '<p><code>date("d/m/Y H:i:s", mktime(11, 45, 30, 4, 10, 2017))</code> = ' . date("d/m/Y H:i:s", mktime(11, 45, 30, 4, 10, 2017)) . '<br>';
echo 'Unix a fêté sa milliardième seconde le ' . date("d/m/Y H:i:s", 1000000000) . '</p>';
echo '<p>Date du jour au format JJ/MM/AAAA : ' . date('d/m/Y') . '<p>';
