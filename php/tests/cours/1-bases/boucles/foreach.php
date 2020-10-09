<?php
$nombres = ['zéro', 'un', 'deux', 'trois', 5 => 'cinq', 'six', 'un' => 1, 'sept', -1 => 'moins un'];
        
echo'<h5>tableau $nombre (valeurs seulement)</h5>';
foreach ($nombres as $nombre) {
    echo $nombre . '<br>';
}

echo'<h5>tableau $nombre (couples clé/valeur)</h5>';
foreach ($nombres as $key => $valeurs) {
    echo $key . ' : ' . $valeurs . '<br>';
}