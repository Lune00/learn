<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 3 : Fonctions utiles</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 3 : Fonctions utiles</h1>
        <h2 class="dif1">Question 1</h2>
        <section class="enonce">Transformer une chaîne écrite dans des casses différentes afin que chaque mot ait son premier caractère en majuscule.</section>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['tp3q1.php', 'tp3q1regex.php'], false, 'tp3q1.php', true, 'La fonction <a href="http://php.net/manual/fr/function.strtolower.php"><code>strtolower()</code></a> passe toute la chaîne en minuscules. La fonction <a href="http://php.net/manual/fr/function.ucwords.php"><code>ucwords()</code></a> passe la première lettre en majuscule. Attention, il ne faut pas se contenter seulement d\'appeler <a href="http://php.net/manual/fr/function.ucwords.php"><code>ucwords()</code></a> car elle ne modifie pas la casse des autres lettres.');
        ?>
        <h2 class="dif2">Question 2</h2>
        <section class="enonce">Formater l'affichage d'une suite de chaînes contenant des noms et prénoms en respectant les critères suivants : un prénom et un nom par ligne, affichés sur 20 caractères chacun; toutes les initiales des mots doivent être alignées verticalement.</section>
        <?php
        afficheCode(['tp3q2.php'], false, 'tp3q2.php', true, 'La fonction <a href="http://php.net/manual/fr/function.printf.php"><code>printf()</code></a> permet de réaliser un affichage formaté à l\'instar d\'autres langages de programmation. Le premier paramètre de cette fonction est une chaîne de caractères contenant des « trous » qui seront remplacés par les valeurs des arguments suivants. Ces trous sont matérialisés par le caractère %. La lettre <code>s</code> indique que la valeur qui sera insérée dans ce trous sera considérée en tant que chaîne de caractères. Le nombre <code>20</code> indique le nombre de caractères à utiliser pour afficher cette valeur. Le signe moins indique que l\'alignement des caractères se fait à gauche (le reste de la place disponible est complété avec des espaces).<br>Un problème est que le langage HTML ne prend pas en compte le fait qu\'il y ait plusieurs espaces. La page s\'affichera avec un seul espace à moins que ce texte soit dans une balise &lt;pre&gt;. Pour que chaque caractère utilise la même largeur, il faut utiliser une police à taille fixe telle que la police <code>Courrier</code>.');
        ?>
        <h2 class="dif1">Question 3</h2>
        <section class="enonce">D'après Wikipédia,  &laquo;&nbsp;Pour des raisons d'habitudes, d'ancienneté du principe, ou de facilité de mise en œuvre, de nombreux développeurs de logiciels utilisent ou ont utilisé le classement selon l'ordre des codes dans le codage de caractères utilisé (par exemple ASCII ou UTF-8), nommé ordre lexicographique&nbsp;&raquo;.<br>Le problème c'est que si on trie '1abc', '2def' et '10ghi', le 10 sera entre le 1 et le 2. Ce n'est pas l'ordre naturel.<br>Trier un tableau suivant l'ordre naturel.</section>
        <?php
        afficheCode(['tp3q3.php'], false, 'tp3q3.php', true, 'La fonction <a href="http://php.net/manual/fr/function.natsort.php"><code>natsort()</code></a> effectue ce tri naturel.');
        ?>
        <h2 class="dif1">Question 4</h2>
        <section class="enonce">Calculer votre âge à l'instant actuel à la seconde près.</section>
        <?php
        afficheCode(['tp3q4.php'], false, 'tp3q4.php', true, 'La fonction <a href="http://php.net/manual/fr/function.time.php"><code>time()</code></a> crée un timestamp UNIX initialisé à la date actuelle.<br>La fonction <a href="http://php.net/manual/fr/function.mktime.php"><code>mktime()</code></a> crée un timestamp UNIX initialisé à la date passée en paramètre. Attention, l\'ordre des paramètres de cette fonction est un peu déroutant pour un non-anglosaxon : c\'est d\'abord l\'heure puis les minutes puis les secondes puis le <b>mois</b> puis le <b>jour</b> et enfin l\'année.<br>Un timestamp UNIX est le nombre de secondes écoulées entre le 1er Janvier 1970 et la date. En faisant la différence entre les deux timestamps, le nombre de secondes écoulées entre les dates est obtenu.<br>La fonction <a href="http://php.net/manual/fr/function.number-format.php"><code>number_format()</code></a> permet la mise en forme de la valeur obtenue en utilisant l\'espace comme séparateur de millier pour une meilleure lisibilité.');
        ?>
        <h2 class="dif1">Question 5</h2>
        <section class="enonce">À quel jour de la semaine correspondait le 25 décembre 2017 ? Afficher le résultat en français.</section>
        <?php
        afficheCode(['tp3q5.php'], false, 'tp3q5.php', true, 'La fonction <a href="http://php.net/manual/fr/function.date.php"><code>date()</code></a> transforme un timestamp UNIX en une chaîne de caractères. Il faut indiquer le format souhaité pour la date via le premier paramètre. Le format <code>N</code> permet d\'obtenir le numéro du jour de la semaine (1 pour Lundi jusqu\'à 7 pour Dimanche). Le second paramètre est le timestamp UNIX à mettre en forme. Il est créé à l\'aide de la fonction <a href="http://php.net/manual/fr/function.mktime.php"><code>mktime()</code></a> (cf. question 4).');
        ?>
        <h2 class="dif2">Question 6</h2>
        <section class="enonce">Déterminer à quel jour de la semaine correspondront tous les 1<sup>er</sup> Mai des années comprises entre 2018 et 2037.<br>Si le jour est un samedi ou un dimanche, afficher le message &laquo; Désolé ! &raquo;.<br>Si le jour est un vendredi ou un lundi afficher &laquo; Week-end prolongé ! &raquo; sinon &laquo; En semaine &raquo;.</section>
        <?php
        afficheCode(['tp3q6.php'], false, 'tp3q6.php', true, 'La première différence par rapport à la question précédente est qu\'une boucle est utilisée pour parcourir toutes les années comprises entre 2018 et 2037. Le second changement est pour le switch : les cas 1 et 5 (Lundi et Vendredi) sont groupés pour indiquer que ce jour férié crée un week-end prolongé et les cas 6 et 7 (Samedi et Dimanche) sont également regroupés pour indiquer que ce jour férié est pendant un week-end. Dans le reste des cas (Mardi, Mercredi et Jeudi), un message indiquera que ce jour férié est en milieu de semaine.');
        ?>
        <h2 class="dif2">Question 7</h2>
        <section class="enonce">Le jour de l’Ascension est le quarantième jour après le jour de Pâques (jour de Pâques compris dans les 40 jours). Calculer les dates de l'Ascension pour les années 2018 à 2037.</section>
        <?php
        afficheCode(['tp3q7.php'], false, 'tp3q7.php', true, 'La première difficulté est de trouver la date de Pâques pour une année donnée. Le calcul est un peu complexe… Heureusement, il est déjà implémenté dans PHP avec la fonction <a href="http://php.net/manual/fr/function.easter-date.php"><code>easter_date()</code></a>. Cette fonction prend en paramètre l\'année pour la date de Pâques recherchée et retourne un timestamp UNIX.<br>Pour trouver la date de l\'Ascension, il faut ajouter 39 jours. Un timestamps UNIX étant un nombres de secondes, il faut ajouter 39 jours convertis en secondes.');
        ?>
        <h2 class="dif3">Question 8</h2>
        <section class="enonce">Afficher le calendrier du mois courant de la manière suivante :</section>
            <?php require 'tp3q8.php'; ?>
        <br>
        <?php
        afficheCode(['tp3q8.php'], false, false, true, 'La fonction <a href="http://php.net/manual/fr/function.date.php"><code>date()</code></a> utilisée avec le format <code>n</code> permet d\'obtenir le numéro du mois (1 pour Janvier jusqu\'à 12 pour Décembre). Si le second paramètre n\'est pas renseigné, la date actuelle est utilisée par défaut. Le second paramètre est le timestamp UNIX à mettre en forme. Il est créé à l\'aide de la fonction <a href="http://php.net/manual/fr/function.mktime.php"><code>mktime()</code></a> (cf. question 4). Selon le numéro de ce mois, le nom du mois correspondant est affiché.<br>La fonction <a href="http://php.net/manual/fr/function.date.php"><code>date()</code></a> avec le format <code>Y</code> permet d\'obtenir l\'année sur 4 chiffres.<br>La variable <code>$donnees</code> est initialisée au premier jour du mois courant. Selon le jour de la semaine de cette date, il faut laisser un certain nombre de cases vide dans le tableau, ceci est réalisé par la première boucle.<br>Tous les jours du mois sont itérés dans la seconde boucle. Pour connaître le nombre de jours dans un mois, il faut encore une fois faire appel à la fonction <a href="http://php.net/manual/fr/function.date.php"><code>date()</code></a> mais cette fois avec le paramètre <code>t</code>. Pour chaque jour, son numéro est affiché dans une case du tableau. Si le jour est un dimanche, la ligne est terminée, il faut donc commencer une nouvelle ligne.');
        ?>

    </body>
</html>