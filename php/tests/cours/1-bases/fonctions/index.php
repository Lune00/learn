<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Les Fonctions</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Les Fonctions</h1>

        <h2>Création d'une fonction</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['somme.php'], true, false);
        ?>

        <h2>Appel d'une fonction</h2>
        <?php afficheCode(['appelSomme.php'], false, 'appelSomme.php') ?>

        <h2>Passage de paramètres</h2>
        <h3>Passage par valeur</h3>
        <?php afficheCode(['passageParValeur.php'], false, 'passageParValeur.php') ?>
        <h3>Passage par référence</h3>
        <?php afficheCode(['passageParReference.php'], false, 'passageParReference.php') ?>

        <h2>Valeur par défaut</h2>
        <?php afficheCode(['valeurParDefaut.php'], false, 'valeurParDefaut.php') ?>

        <h2>Variable statique</h2>
        <?php afficheCode(['variableStatique.php'], false, 'variableStatique.php') ?>

        <h2>Fonction variable</h2>
        <?php afficheCode(['fonctionVariable.php'], false, 'fonctionVariable.php') ?>

        <h2>Passage d'une fonction en paramètre</h2>
        <?php afficheCode(['passageFctEnParam.php'], false, 'passageFctEnParam.php') ?>

        <h2>Fonction anonyme</h2>
        <?php afficheCode(['fonctionAnonyme.php'], false, 'fonctionAnonyme.php') ?>

        <h2>Fonction typée</h2>
        <?php afficheCode(['fonctionTypee.php'], false, 'fonctionTypee.php'); ?>

        <h2>Utilisation d'une variable globale</h2>
        <?php
        $fichiers = ['variableGlobale.php'];
        $execution = 'variableGlobale.php';
        require '../../afficheCode2.php';
        ?>
    </body>
</html>
