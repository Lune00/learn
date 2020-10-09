<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Héritage de classe</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Héritage</h1>
        <h2>Définition de la classe</h2>
        <?php
        $fichiers = ['../classes/UtilisateurAvecCouleurs.class.php'];
        $commentaires = 'Le mot clé <code>extends</code> est utilisé pour définir un héritage<br><code>parent::</code> permet d\'accéder aux méthodes protégées et publiques de la classe parent';
        require '../../afficheCode2.php';
        ?>
        <h2>Utilisation de la classe fille</h2>
        <?php
        $fichiers = ['../heritage/utilisation.php'];
        unset($commentaires);
        $execution = '../heritage/utilisation.php';
        require '../../afficheCode2.php';
        unset($louis);
        ?>
    </body>
</html>