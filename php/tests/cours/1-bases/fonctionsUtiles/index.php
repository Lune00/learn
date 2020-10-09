<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Fonctions utiles</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Fonctions utiles</h1>

        <h2>Changements de casse</h2>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['changementCasse.php'], false, 'changementCasse.php', false, 'Attention <code>ucwords()</code> ne passe pas le reste en minuscules !<br>Remarquez également que les lettres accentées ne sont pas passées en majuscules');
        ?>

        <h2>Mise en forme de numériques</h2>
        <?php
        afficheCode(['miseEnFormeDeNumeriques.php'], false, 'miseEnFormeDeNumeriques.php', false, 'Vous remarquerez que la fonction <a href="http://php.net/manual/fr/function.number-format.php"><code>number_format()</code></a> effectue les arrondis au plus proche')
        ?>

        <h2>Recherche dans une chaine de caractères avec <a href="http://php.net/manual/fr/function.strpos.php"><code>strpos()</code></a></h2>
        <h3>Occurrence trouvée</h3>
        <?php afficheCode(['rechercheDansUneChaineAt.php'], false, 'rechercheDansUneChaineAt.php'); ?>
        <h3>Occurrence trouvée en première position</h3>
        <?php afficheCode(['rechercheDansUneChaineH.php'], false, 'rechercheDansUneChaineH.php', false, 'Vous remarquerez que le test utilise le triple égal et non le double égal car avec n\'oubliez pas que zéro est équivalent à <code>false</code>'); ?>
        <h3>Occurrence non trouvée</h3>
        <?php afficheCode(['rechercheDansUneChaineW.php'], false, 'rechercheDansUneChaineW.php', false, 'Ce qui peut paraitre surprenant c\'est que la fonction retourne le booléen <code>false</code> dans ce cas là alors que dans les autre cas, la fonction retournait un entier... La fonction renvoie en fait un type <a href="http://php.net/manual/fr/language.pseudo-types.php#language.types.mixed"><code>mixed</code></a>, c\'est-à-dire que la valeur peut avoir un type différent en fonction de la situation.'); ?>

        <h2>Manipulation de dates</h2>
        <h3>Les fonctions <a href="http://php.net/manual/fr/function.date.php"><code>date()</code></a> et <a href="http://php.net/manual/fr/function.date.php"><code>mktime()</code></a></h3>
        <?php afficheCode(['dateMkTime.php'], false, 'dateMkTime.php') ?>

        <h3>Modification des paramètres de <code>php.ini</code> pour ce script grâce à <a href="http://php.net/manual/fr/function.ini-set.php"><code>ini_set()</code></a></h3>
        <?php afficheCode(['iniSet.php'], false, 'iniSet.php'); ?>

    </body>
</html>