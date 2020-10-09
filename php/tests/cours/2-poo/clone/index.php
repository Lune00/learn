<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Clonage d'une classe</title>     
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Clonage d'une classe</h1>
        
        <h2>Plusieurs variables référencant la même instance</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['../classes/ClasseACloner1.class.php', '../classes/ObjetCible.class.php', 'ref.php'], true, 'ref.php');
        ?>
        
        <h2>Clonage partiel de l'instance</h2>
        <?php
        afficheCode(['cp.php'], false, 'cp.php');
        ?>

        <h2>Clonage avec utilisation de la méthode magique <a href="http://php.net/manual/fr/language.oop5.cloning.php#object.clone"><code>__clone()</code></a></h2>
        <?php
        afficheCode(['../classes/ClasseACloner2.class.php', 'mag.php'], true, 'mag.php', false, 'La méthode magique <a href="http://php.net/manual/fr/language.oop5.cloning.php#object.clone"><code>__clone()</code></a> est appelée automatiquement lors de la création d\'un clone. Cela permet d\'une part d\'effectuer un clonage des attributs de type référence et d\'autre part de mettre à jour le nombre d\'instances créées.');
        ?>
    </body>
</html>