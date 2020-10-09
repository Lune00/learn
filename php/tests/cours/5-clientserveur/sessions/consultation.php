<?php session_start(); ?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Consultation des informations de la session</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Consultation des informations de la session</h1>
        
        <h2>Récupération de la session</h2>
        <p>Pour récupérer la session, il faut à nouveau faire appel à la fonction <a href="http://php.net/manual/fr/function.session-start.php"><code>session_start()</code></a> avant d'écrire le moindre code HTML.</p>
        <?php highlight_file('sessionStart.php'); ?>
        <h2>La fonction <a href="http://php.net/manual/fr/function.session-id.php"><code>session_id()</code></a></h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['sessionId.php'], false, 'sessionId.php');
        ?>
        <h2>La variable superglobale <code><a href="http://php.net/manual/fr/reserved.variables.session.php">$_SESSION</a></code></h2>
        <?php
        afficheCode(['dollarSession.php'], false, 'dollarSession.php');
        ?>
        <h2>La méthode <a href="http://php.net/manual/fr/function.filter-input.php"><code>filter_input</code></a></h2>
        <?php
        afficheCode(['filterInput.php'], false, 'filterInput.php',false, 'Ne fonctionne pas avec la version actuelle (PHP7)');
        ?>
        <h2>Consultation du cookie de session</h2>
        <?php
        afficheCode(['cookieSession.php'], false, 'cookieSession.php');
        ?>
        <a href="suppression.php" class="executer">Suppression de la session</a>
    </body>
</html>