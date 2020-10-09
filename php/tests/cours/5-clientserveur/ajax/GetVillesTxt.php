<?php
$valeurs = [
    '67000' => ['Strasbourg'],
    '67100' => ['Strasbourg'],
    '67200' => ['Strasbourg'],
    '67110' => ['Dambach', 'Gumbrechtshoffen'],
    '67120' => ['Altorf', 'Avolsheim', 'Dachstein', 'Dorlisheim']];

$cp = filter_input(INPUT_GET, 'cp', FILTER_SANITIZE_NUMBER_INT);
if (isset($valeurs[$cp]))
    echo implode('|', $valeurs[$cp]);
