<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 3</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Requêter une base de données</h1>
        <?php
        include 'tp1q3e.php';
        require_once '../../afficheCode.php';
        afficheCode(['tp1q3.php'], true, 'tp1q3.php', true, '<h5>L\'authentification</h5>La première page est la page de connexion. Dans la vraie vie, cette méthode d\'autentification ne serait pas assez sécurisée…<h5>L\'édition des données</h5>Le premier test vérifie que les données ont été transmises et qu\'elles sont bien du bon type. Ensuite, si les données transmises sont correctes, une requête est envoyée à la base de données pour récupérer les données de l\'utilisateur. Le second test vérifie cela et si c\'est le cas, un formulaire contenant les données est affiché. Si l\'un des deux tests a échoué alors l\'utilisateur est redirigé après 5 secondes vers la page d\'authentification grâce à l\'instruction <code>header("refresh:5;url=tp1q3c.php");</code>.<h5>Le traitement des données</h5>Cette dernière page est assez analogue à la précédente :<ul><li>elle vérifie les données saisies (code postal sur cinq chiffres avec une expression rationnelle en particulier) ;</li><li>elle envoie une requête à la base pour mettre à jour les données ;</li><li>enfin, elle affiche un message en fonction du succès ou de l’échec de cette dernière opération. La méthode <a href="http://php.net/manual/fr/pdostatement.execute.php"><code>execute()</code></a> retourne un booléen indiquant si la requête a réussi.</li></ul>');
        ?>
    </body>
</html>
