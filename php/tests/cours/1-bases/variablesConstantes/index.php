<?php
// Déclaration de variables qui seront utilisées plus loin.
// Cette section de code PHP ne génère par de sortie dans la page HTML (pas d’appel à echo).
$nom = 'Julie'; // nom de l'utilisateur
$titre_page = 'Titre de la page ...'; // titre de la page
$aujourdhui = date("d/m/Y"); // date du jour
$heure = date("H:i:s"); // heure 
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>
            <?php echo $titre_page; ?>
        </title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Variables et constantes</h1>
        <h2>Affectation de valeurs</h2>
        <code><?php highlight_file('entete.php'); ?></code>
        <h4 class="commentaires">Commentaires</h4>
        <div>
            Les variables ne sont pas déclarées.
            Il suffit d'affecter une valeur à une variable pour qu'elle existe.
            Cela est très pratique mais aussi dangeureux car il est très facile de se tromper en écrivant le nom d'une variable et du coup cela en créera une seconde et générera sans aucun doute un disfonctionnement.<br>
            Les variables peuvent être créer à n'importe quel moment (pas uniquement avant le début du code HTML comme dans cet exemple).
        </div>
        <h2>Affichage de valeur de variables</h2>
        <?php
        $fichiers = ['affichage.php'];
        $execution = 'affichage.php';
        require '../../afficheCode2.php';
        ?>
        <h2>Assignation par valeur</h2>
        <?php
        $fichiers = ['assVal.php'];
        $execution = 'assVal.php';
        $commentaires = 'Chaque variable possède sa propre zone mémoire contenant sa valeur.';
        require '../../afficheCode2.php';
        ?>
        <h2>Assignation par référence</h2>
        <?php
        $fichiers = ['assRef.php'];
        $execution = 'assRef.php';
        $commentaires = 'Les deux variables partagent la même zone mémoire contenant l\'unique valeur.';
        require '../../afficheCode2.php';
        ?>
        <h2>Les variables dynamiques</h2>
        <?php
        $fichiers = ['varDyn.php'];
        $execution = 'varDyn.php';
        $commentaires = 'Il est possible d\'accéder au contenu d\'une variable dont le nom est contenu dans une variable.';
        require '../../afficheCode2.php';
        ?>
        <h2>Fonctions utiles</h2>
        <?php
        $fichiers = ['fctUti.php'];
        $execution = 'fctUti.php';
        unset($commentaires);
        require '../../afficheCode2.php';
        ?>
        <h2>Les constantes</h2>
        <?php
        $fichiers = ['fctCst.php'];
        $execution = 'fctCst.php';
        require '../../afficheCode2.php';
        ?>
        <h2>Les variables - le transtypage</h2>
        <h3>Changement de type</h3>
        <?php
        $fichiers = ['chgTyp.php'];
        $execution = 'chgTyp.php';
        require '../../afficheCode2.php';
        ?>
        <h3>Transtypage explicite</h3>
        <?php
        $fichiers = ['transExp.php'];
        $execution = 'transExp.php';
        require '../../afficheCode2.php';
        ?>
        <h3>Transtypage implicite</h3>
        <?php
        $fichiers = ['transImp.php'];
        $execution = 'transImp.php';
        require '../../afficheCode2.php';
        ?>
    </body>
</html>