<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 4</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Requêter une base de données</h1>
        <?php
        include 'tp1q4e.php';
        require_once '../../afficheCode.php';
        $exemple = ['AB123CD' => ['immat'=>'AB123CD', 'modele'=>'REN_MEG_ES', 'couleur'=>'MO', 'date'=>'1996-01-31'], 'AB987BA' => ['immat'=>'AB987BA', 'modele'=>'POR_911_ES', 'couleur'=>'CL', 'date'=>'2018-03-15'], 'ok' => 'Enregistrer les modifications'];
        ob_start();
        var_dump($exemple);
        $tab = ob_get_clean();
        afficheCode(['tp1q4.php'], true, 'tp1q4.php', true, 'Le script PHP fait à la fois l’affichage du formulaire et son traitement. Une fonction <code>choix()</code> est définie permettant de générer le code HTML pour une liste déroulante. Elle prend en paramètre un tableau à deux dimensions contenant les valeurs à afficher et les codes associés à ces valeurs.<br>L’instruction <code>$voitures = $pdo->query(\'SELECT * FROM voitures;\')->fetchAll();</code> permet de récupérer toutes les voitures enregistrées en base dans un tableau PHP. Le tableau HTML est complété en parcourant celui-ci.<br>Pour que les champs modèle de chaque voiture n’aient pas le même nom, ceux-ci ont été nommé en utilisant l’immatriculation de la voiture qui est unique. Le champ modèle d’une voiture peut par exemple être nommé « <code>AB123CD[id_modele]</code> ». Les crochets vont générer un tableau dans lequel à la clé « <code>AB123CD</code> » sera associé un autre tableau associant à la clé « <code>id_modele</code> » la valeur du champ. Ceci est également réalisé pour les autres champs. Ainsi le tableau <code>$_POST</code> sera rempli par exemple comme ceci :'.$tab.'Lorsque le formulaire est traité, le tableau <code>$_POST</code> est parcouru immatriculation par immatriculation et une requête est envoyée pour mettre à jour les données.');
        ?>
    </body>
</html>
