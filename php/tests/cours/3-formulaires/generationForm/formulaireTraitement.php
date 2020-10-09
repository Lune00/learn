<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Formulaire traitement à part</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Formulaire traitement à part</h1>

        <h2>Les variables superglobales <a href="http://php.net/manual/fr/reserved.variables.get.php"><code>$_GET</code></a>, <a href="http://php.net/manual/fr/reserved.variables.post.php"><code>$_POST</code></a> et <a href="http://php.net/manual/fr/reserved.variables.request.php"><code>$_REQUEST</code></a></h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['recupInfos.php'], false, 'recupInfos.php', false, 'Vous remarquerez que les deux fichiers sont très liés : Si on change la valeur de l\'attribut <code>name</code> d\'une des balise <code>input</code>, il faudra en tenir compte dans le fichier traitant le formulaire. Les tableaux ont du être défini dans les deux fichiers...<br>Il est donc dans les bonnes pratiques d\'avoir un même fichier php affichant et traitant le formulaire.');
        ?>

    </body>
</html>