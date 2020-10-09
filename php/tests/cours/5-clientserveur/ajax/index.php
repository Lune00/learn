<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>AJAX</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>AJAX : Asynchronous JAvascript and Xml</h1>
        <h2>Une page php qui sera appelée de manière asynchrone</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['getVillesTxt.php']);
        ?>
        <h4>Appel à la page <code>getVillesTxt.php</code></h4>
        <a href="getVillesTxt.php?cp=67110" class="executer">Appel à getVillesTxt.php?cp=67110</a><br>
        <a href="getVillesTxt.php?cp=67400" class="executer">Appel à getVillesTxt.php?cp=67400</a>
        <h2>L'appel asynchrone avec JavaScript</h2>
        <p>Maintenant que nous avons côté serveur une page qui nous fournit dynamiquement les villes ayant ce code postal,
            du côté du client un appel asynchrone est mis en place avec du code JavaScript pour y faire appel.</p>
        <?php
        afficheCode(['formulaire.php', 'villesParCp.js'], true, 'formulaire.php');
        ?>
    </body>
</html>
