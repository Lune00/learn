<?php
$listeCours = [
    '10-Developpement Web côté serveur avec PHP et Symfony',
    '15-Conduite et gestion de projet',
    '8-Analyse et Conception',
    '5-PL_SQL avec Oracle',
    '6-Developpement en couches avec Java SE',
    '13-Développement Web côté serveur avec JEE',
    '19-Développement d\'une application mobile avec Android',
    '20-Développement Android - Projet',
    '14-Projet 2 - Application Web',
    '2-Initiation à la programmation procédurale avec Java',
    '18-Développement Web côté serveur en ASPX',
    '9-Développement Web côté client',
    '21-Développement cross plateforme avec Xamarin',
    '7-Projet1-ClientServeur-JavaSE',
    '1-Algorithmique',
    '11-Integration Graphique',
    '16-Utiliser les frameworks pour le développement JEE',
    '12 - CMS - WordPress',
    '4-SQL avec SQL Server',
    '3-POO avec Java',
    '17-Linux  et Admin Apache'
];

natsort($listeCours);
echo '<ul>';
foreach ($listeCours as $cours) {
    echo '<li>'.$cours.'</li>';
}
echo '</ul>';
