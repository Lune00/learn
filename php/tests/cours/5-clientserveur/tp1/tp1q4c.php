<?php require 'tp1q4init.php'; ?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 4</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Échanges client-serveur</h1>
        <script src="tp1q4.js"></script>
        <?php
        require 'tp1q4e.php';
        echo '<div>';
        require 'tp1q4.php';
        echo '</div>';
        require_once '../../afficheCode.php';
        afficheCode(['tp1q4init.php', 'tp1q4.php', 'tp1q4.js', 'getModeles.php'], true, false, true, '<h5>Ajout des données</h5>Lorsque le formulaire est soumis, une première requête est envoyée pour récupérer l\'identifiant du modèle. Si celui-ci n\'existe pas aucune ligne n\'est retournée (pour connaitre le nombre de lignes retournées la méthode <a href="http://php.net/manual/fr/pdostatement.rowcount.php"><code>rowCount()</code></a> est utilisée), alors une requête est effectuée pour le créer. Dans les deux cas, la variable <code>$idModele</code> est initialisée avec le code du modèle.<h5>AJAX</h5>Le script PHP « <code>getModeles.php</code> » permet de générer la liste des modèles d\'une marque passée en paramètre. Le javascript « <code>tp1q4.js</code> » effectue un appel asynchrone à ce script PHP lorsque l\'utilisateur quitte la zone de texte de la marque.');
        ?>
    </body>
</html>