<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>PDO : Les procédures et fonctions stockées</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>PDO : Les procédures et fonctions stockées</h1>
        <h2>Procédure stockée sans Paramètre</h2>
        <?php
        $fichiers = ['sansParam.php'];
        $execution = 'sansParam.php';
        require '../../afficheCode2.php';
        ?>
        
        <h2>Procédure stockée avec Paramètre</h2>
        <?php
        $fichiers = ['avecParam.php'];
        $execution = 'avecParam.php';
        require '../../afficheCode2.php';
        ?>
        
        <h2>Fonction stockée</h2>
        <?php
        $fichiers = ['fct.php'];
        $execution = 'fct.php';
        require '../../afficheCode2.php';
        ?>
    </body>
</html>
