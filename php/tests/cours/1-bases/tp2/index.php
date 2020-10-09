<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 2 : Tableaux</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <?php require '../../afficheCode.php'; ?>
        <h1>TP 2 : Tableaux</h1>
        <h2 class="dif1">Question 1</h2>
        <section class="enonce">Créer un tableau multidimensionnel associatif dont les clés sont des noms de personnes et les valeurs des tableaux indicés contenant le prénom, la ville de résidence et l'âge de la personne.</section>
        <?php
        afficheCode(['tp2q1.php'], false, 'tp2q1.php', true, 'L\'instruction <code>$gerard[] = "gérard";</code> crée un tableau et positionne dans la case d\'indice 0 la valeur « gérard ». La seconde instruction est semblable mais le tableau existe à présent. Cette instruction ajoute une nouvelle valeur au tableau dans la case d\'indice 1. Les six premières instructions créent deux tableaux à une seule dimension. Les deux instructions suivantes permettent de mettre ces deux tableaux dans un tableau. C\'est une manière de créer un tableau multidimensionnel en PHP.');
        ?>
        <h2 class="dif1">Question 2</h2>
        <section class="enonce">Créer un tableau multidimensionnel associatif dont les clés sont des noms de personnes et les valeurs des tableaux associatifs dont les clés sont le prénom, la ville de résidence et l'âge de la personne avec une série de valeurs associées.</section>
        <?php
        afficheCode(['tp2q2.php'], false, 'tp2q2.php', true, 'Il aurait tout à fait possible été possible de faire quelque chose de similaire à la solution proposée pour la question précédente. Il aurait suffi d\'ajouter entre les crochets des six premières instructions les clés adéquates.<br>La solution proposée ici se base sur la création et l\'initialisation d\'un tableau en une seule instruction avec <a href="http://php.net/manual/fr/function.array.php"><code>array()</code></a> ou sa version plus courte <a href="http://php.net/manual/fr/language.types.array.php"><code>[]</code></a>.')
        ?>
        <h2 class="dif1">Question 3</h2>
        <section class="enonce">Utiliser une boucle foreach pour lire les tableaux des exercices 1 et 2 et afficher les informations avec le format suivant :
            <ul><li>Element dupont<ul><li>élément 0 : gérard </li><li>élément 1 : paris </li><li>élément 2 : 67 </li></ul></li><li>Element badin<ul><li>élément 0 : aurélie </li><li>élément 1 : nantes </li><li>élément 2 : 31 </li></ul></li></ul>
        </section>
        <p>tableau de la question 1 :</p>
        <?php
        afficheCode(['tp2q3-1.php'], false, 'tp2q3-1.php', true, 'L\'instruction <code>require \'tp2q1.php\';</code> fait appel au code réalisé pour la question 1 afin que le tableau soit créé et initialisé.<br>L\'instruction <code>echo \'&lt;ul&gt;\';</code> débute une liste à puce.<br>Le <code>foreach ($personnes as $nom => $valeurs)</code> va parcourir toutes les lignes du tableau <code>$personnes</code>. Successivement les variables <code>$nom</code> et <code>$valeurs</code> vont valoir respectivement la clé et la valeur de la première ligne puis de la seconde jusqu\'à la dernière ligne.<br>L\'instruction <code>echo \'&lt;li&gt;Element \' . $nom . \'&lt;ul&gt;\';</code> positionne un élément dans la liste et commence une nouvelle liste. Cela permet de faire un second niveau dans la liste.<br>La boucle <code>for ($i = 0; $i < count($valeurs); $i++)</code> parcours chaque élément du tableau. La fonction <a href="http://php.net/manual/fr/function.count.php"><code>count()</code></a> permet de connaître la taille de ce tableau.');
        ?>
        <p>tableau de la question 2 :</p>
        <?php
        afficheCode(['tp2q3-2.php'], false, 'tp2q3-2.php', true);
        ?>

        <h2 class="dif2">Question 4</h2>
        <section class="enonce">Créer un tableau contenant une liste d'adresses e-mail. Extraire le nom de serveur de ces données, puis réaliser des statistiques sur les occurrences de chaque fournisseur d'accès.</section>
        <?php
        afficheCode(['tp2q4.php'], false, 'tp2q4.php', true, 'L\'instruction <code>$d = explode(\'@\', $m)[1]</code> récupère le nom de domaine du mail :<ul><li>La fonction <a href="http://php.net/manual/fr/function.explode.php"><code>explode()</code></a> découpe une chaîne de caractères en fonction d\'un délimiteur choisi (@ dans ce cas). Chaque partie est positionnée dans une case du tableau retourné.</li><li>Uniquement la seconde partie est conservée car c\'est le nom de domaine qui est recherché. Pour cela, le <code>[1]</code> permet d\'accéder à la seconde case du tableau obtenu.</li></ul>Il est à noter l\'absence de vérification que l\'ensemble des mails soient bien formés (présence du @). Cette vérification pourra être ajoutée après avoir pris connaissance de la suite du cours.');
        ?>
        <h2 class="dif3">Question 5</h2>
        <section class="enonce">Créer un tableau d'entiers variant de 1 à 63, puis à partir de celui ci un autre tableau de nombres variant de 0 à 6.3. Créer ensuite un tableau associatif dont les clés X varient de 0 à 6.3 et dont les valeurs sont sin(X). Afficher ce tableau dans un tableau HTML.</section>
        <?php
        afficheCode(['tp2q5.php'], false, 'tp2q5.php', true, 'La première boucle crée un tableau dont les valeurs sont tous les entiers compris entre 1 et 63.<br>Pour le second tableau, la première case est créée individuellement avec l\'instruction <code>$t2[] = 0;</code>. Les autres cases de ce tableau sont créées en prenant les valeurs du premier tableau et en les divisant par dix.<br>Chaque valeur du second tableau est utilisée pour remplir le troisième tableau. Le tableau est un tableau associatif :<ul><li>La clé est la valeur transformée en chaîne de caractères. Une clé ne peut être qu\'un entier ou une chaîne de caractères. Si le cast en chaîne <code>(string)</code> n\'est pas utilisé, la valeur sera automatiquement transformée en entier. Dans ce cas-là, la valeur 0.1 serait convertie en 0 et viendrait écraser la case <code>$t3[0]</code>.</li><li>La valeur associée à cette clé est la valeur du second tableau à laquelle la fonction sinus (<a href="http://php.net/manual/fr/function.sin.php"><code>sin()</code></a>) a été appliquée.</li></ul>La fin du script permet l\'affichage d\'un tableau au format HTML en parcourant le troisième tableau.');
        ?>

    </body>
</html>