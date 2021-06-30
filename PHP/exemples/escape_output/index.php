<?php

//Run : se placert à la racine, puis php -S localhost:5000 

//Concept: utiliser une convention de nommage pour distinguer les données envoyées au client des autres, mettre toutes
//les données dans un tableau $html = array(). Toujours préférer htmlentities() avec 2 parametres : quotes et encodage (meme que dans header requete)

//Données dans l'app
$data = '<h1>Données en provencance d\'un formulaire, d\'une source externe(database, API...). Ici des guillements doubles ""</h1>';

//Bad
echo 'Not escaping' . PHP_EOL;
echo "<p>Voici les donnéées $data </p>";

//Better
echo 'Escaping' . PHP_EOL;
$html = array();
//Toujours ENT_QUOTES pour échapper les quotes simples et doubles
$html['data'] = htmlentities($data, ENT_QUOTES, 'UTF_8');
echo "<p>Voici les données {$html['data']} </p>";
