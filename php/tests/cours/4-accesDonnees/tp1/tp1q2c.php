<?php
require_once './tp1q2init.php';
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 2</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Requêter une base de données</h1>
        <?php
        include 'tp1q2e.php';
        echo '<div>';
        require 'tp1q1.php';
        echo '</div>';
        require_once '../../afficheCode.php';
        afficheCode(['tp1q2init.php', 'tp1q2.php'], true, 'tp1q2.php', true, 'Le script « <code>tp1q2init.php</code> » est positionné tout au début de la page HTML. Il sert à exécuter la requête d’insertion lorsque le formulaire a été soumis. La requête utilise les valeurs saisies par l’utilisateur dans le formulaire. Il est donc nécessaire d’une part de filtrer ces données pour éviter l’exécution de code JS par exemple (cf. le module sur les formulaires) mais il faut également se prémunir contre l’injection de code SQL. À cette fin, la requête est préparée en utilisant la méthode <a href="http://php.net/manual/fr/pdo.prepare.php"><code>prepare()</code></a>. Les paramètres sont associés à la requête grâce à la méthode <a href="http://php.net/manual/fr/pdostatement.bindvalue.php"><code>bindValue()</code></a>. Enfin la requête est exécutée grâce à la méthode <a href="http://php.net/manual/fr/pdostatement.execute.php"><code>execute()</code></a>.<br>Le script « <code>tp1q2.php</code> » crée un formulaire en utilisant la classe <code>Form</code> précédemment codée.');
        ?>
    </body>
</html>
