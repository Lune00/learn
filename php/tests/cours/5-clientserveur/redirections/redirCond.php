<?php
$nom = filter_input(INPUT_POST, 'nom', FILTER_SANITIZE_STRING);
if(!$nom) {
    header('Location: saisieNom.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Les redirections</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Bonjour <?= $nom ?></h1>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>
