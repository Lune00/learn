<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>PDO : Requête non préparée</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>PDO : Requête non préparée</h1>
        <h2>Ordre de type SELECT</h2>
        <h3>Récupération d'une ligne</h3>
        <?php
        $fichiers = ['np1l.php'];
        $execution = 'np1l.php';
        require '../../afficheCode2.php';
        ?>
        
        <h3>Récupération de plusieurs lignes</h3>
        <?php
        $fichiers = ['nppl.php'];
        $execution = 'nppl.php';
        require '../../afficheCode2.php';
        ?>
        
        <h2>Ordre de type INSERT, UPDATE ou DELETE</h2>
        
        <h3>Insertion</h3>
        <?php
        $fichiers = ['ins.php'];
        $execution = 'ins.php';
        require '../../afficheCode2.php';
        ?>
        
        <h3>Modification</h3>
        <?php
        $fichiers = ['upd.php'];
        $execution = 'upd.php';
        require '../../afficheCode2.php';
        ?>
        
        <h3>Suppression</h3>
        <?php
        $fichiers = ['del.php'];
        $execution = 'del.php';
        require '../../afficheCode2.php';
        ?>
    </body>
</html>
