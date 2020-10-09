<?php require './tp1q1init.php'; ?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 1</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
        <?php require './tp1q1style.php'; ?>
    </head>
    <body>
        <h1>TP 1 : Échanges client-serveur</h1>
        <?php
        require './tp1q1e.php';
        echo '<div>';
        require './tp1q1.php';
        echo '</div>';
        require_once '../../afficheCode.php';
        afficheCode(['tp1q1init.php', 'tp1q1style.php', 'tp1q1.php'], true, false, true, 'Le script « <code>tp1q1init.php</code> » teste si le formulaire a été soumis. Pour cela, il teste l\'existence de paramètres <code>background</code> et <code>color</code>.<br>Pour éviter d\'avoir à dupliquer le code, une boucle est utilisée. À la première itération, la variable <code>$propriété</code> vaut « background » et à la seconde itération, elle vaut « color ». La valeur est filtrée et est stockée dans une variable du même nom grâce à la variable dynamique <code>$$propriete</code>. Un cookie est alors créé grâce à la méthode <a href="http://php.net/manual/fr/function.setcookie.php"><code>setcookie()</code></a>.<br>Le script « <code>tp1q1style</code> » définit une balise HTML style permettant de modifier dynamiquement le style de la page. Le sélecteur universel <code>*</code> est utilisé afin de modifier le style de tous les éléments de la page.<br>Une boucle est à nouveau utilisée pour ne pas avoir à écrire le code une fois pour color et une autre pour background. Le premier test correspond à « si la propriété n\'a pas été complétée par le formulaire et qu\'il y a un cookie pour cette propriété ». Dans ce cas la valeur du cookie est filtrée et stockée dans la variable. Enfin si la variable est définie, une règle est définie.<br>Pour générer le formulaire une boucle est également utilisée afin d\'éviter d\'avoir à dupliquer le code générant le choix d\'une couleur.');
        ?>
    </body>
</html>