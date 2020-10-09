<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 1</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Formulaires</h1>
        <h2>Question 1</h2>
        <section class="enonce">Créer une page html contenant un  formulaire comprenant un groupe de champs ayant pour titre "<code>Adresse client</code>". Le groupe doit permettre la saisie du nom, du prénom, de l'adresse, de la ville et du code postal. Les données sont ensuite traitées par un fichier PHP séparé récupérant les données et les affichant dans un tableau HTML.</section>
            <?php
            require_once '../../afficheCode.php';
            afficheCode(['tp1q1.php'], false, 'tp1q1.php', true, 'Le formulaire est généré en utilisant la classe Form précédemment codée. Les données récupérées par le formulaire sont filtrées pour éviter d\'interpréter du code.');
            ?>
    </body>
</html>
