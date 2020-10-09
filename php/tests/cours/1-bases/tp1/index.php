<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 : Variables et constantes</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <?php require '../../afficheCode.php'; ?>
        <h1>TP 1 : Variables et constantes</h1>
        <h2 class="dif1">Question 1</h2>
        <section class="enonce">Déclarer 4 variables ayant pour valeur <code>true</code>, <code>42</code>, <code>12.34</code> et <code>'Hello !'</code><br>
        Afficher le type et la valeur de ces variables.</section>
        <?php
        afficheCode(['tp1q1.php'], false, 'tp1q1.php', true, 'La fonction <a href="http://php.net/manual/fr/function.var-dump.php"><code>var_dump()</code></a> permet d’afficher le type et la valeur d’une variable.');
        ?>
        <h2 class="dif2">Question 2</h2>
        <section class="enonce">Donner les valeurs de <code>$x</code>, <code>$y</code>, <code>$z</code> à la fin du script suivant (sans l’exécuter !  :-)).</section>
        <?php
        afficheCode(['tp1q2.php'], false, 'tp1q2r.php', true, 'Les instructions <code>$x = "PostgreSQL";</code> et <code>$y = "MySQL";</code> initialisent les variables <code>x</code> et <code>y</code>.<br>L\'instruction <code>$z = &$x;</code> indique que la variable <code>z</code> est un alias pour la variable <code>x</code>. Ces deux variables partagent la même valeur.<br>L\'instruction <code>$x = "PHP 5";</code> modifie la valeur de la variable <code>x</code>. Puisque cette valeur est partagée avec le variable <code>z</code>, elles valent toutes les deux <code>\'PHP 5\'</code>.<br>Enfin, l\'instruction <code>$y = &$x;</code> écrase la valeur précédente de y pour en faire un alias de la variable <code>x</code>. Les variables <code>x</code>, <code>y</code> et <code>z</code> partagent donc la même valeur.');
        ?>
        <h2 class="dif1">Question 3</h2>
        <section class="enonce">Donner la valeur booléenne des variables <code>$a</code>, <code>$b</code>, <code>$c</code>, <code>$d</code>, <code>$e</code> et <code>$f</code>.</section>
        <?php
        afficheCode(['tp1q3.php'], false, 'tp1q3r.php', true, 'La valeur entière <code>0</code> est équivalente à <code>FALSE</code>. Toute autre valeur est équivalente à <code>TRUE</code>.<br>Les chaînes de caractères <code>\'\'</code> (chaîne vide) et <code>\'0\'</code> sont équivalents à FALSE, les autres à <code>TRUE</code>.<br>Pour que <code>$a OR $b</code> vaille <code>TRUE</code>, il faut que soit <code>$a</code>, soit <code>$b</code>, soit les deux vaillent <code>TRUE</code>.<br>Pour que <code>$a AND $b</code> vaille <code>TRUE</code>, il faut que <code>$a</code> et <code>$b</code> vaillent toutes les deux <code>TRUE</code>.<br>Pour que <code>$a XOR $b</code> vaille <code>TRUE</code>, il faut qu’une et une seule des deux variables vaille <code>TRUE</code>.');
        ?>
        <h2 class="dif2">Question 4</h2>
        <section class="enonce">Donner le type et la valeur de chacune des variables pendant et à la fin du script suivant et vérifier ensuite vos réponses en modifiant le script :</section>
        <?php
        highlight_file('tp1q4.php');
        afficheCode(['tp1q4c.php'], false, 'tp1q4c.php', true, 'L\'instruction <code>$X = "PHP7";</code> initialise la variable <code>X</code>.<br>L\'instruction <code>$A = &$X;</code> indique que la variable <code>A</code> est un alias pour la variable <code>X</code>. Ces deux variables partagent la même valeur.<br>L\'instruction <code>$Y = " 7 eme version de PHP";</code> initialise la variable <code>Y</code>.<br>L\'instruction <code>$Z = $Y * 10;</code> effectue une multiplication. Il faut donc que les opérandes soient des nombres la chaîne de caractère <code>" 7 eme version de PHP"</code> est donc convertie en nombre : 7 puis la multiplication est réalisée.<br>Enfin l\'instruction <code>$X = $Y * $Y;</code> effectue deux fois cette conversion pour multiplier les deux nombres entre eux.');
        ?>
    </body>
</html>