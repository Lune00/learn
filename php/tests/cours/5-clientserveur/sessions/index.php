<?php
// Création de la session si elle n'a pas encore été créée ou récupération de celle existante
session_start();
// Enregistrer deux informations dans la session.
$_SESSION['nom'] = 'Shannon';
$_SESSION['prenoms'] = ['Claude', 'Elwood']; //tableau
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Création d'une session</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Création d'une session</h1>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
        <a href="consultation.php" class="executer">Consultation des informations de la session</a>
    </body>
</html>