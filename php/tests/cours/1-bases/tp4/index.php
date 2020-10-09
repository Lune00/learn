<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 4 : Fonctions</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 4 : Fonctions</h1>
        <?php
        require 'tp4q1e.php';
        require_once '../../afficheCode.php';
        afficheCode(['tp4q1f.php', 'tp4q1.php'], true, 'tp4q1.php', true, 'La fonction est définie dans un fichier à part. Le script, ayant besoin de connaitre la définition de cette fonction, inclut son code grâce à l\'instruction <a href="http://php.net/manual/fr/function.require-once.php"><code>require_once</code></a>.');
        
        require 'tp4q2e.php';
        afficheCode(['tp4q2f.php', 'tp4q2.php'], true, 'tp4q2.php', true, 'Les paramètres doivent être passés par référence avec le caractère <a href="http://php.net/manual/fr/language.references.pass.php"><code>&</code></a> sinon les modifications effectuées sur ces paramètres ne modifieraient pas les valeurs des variables du programme principal.');

        require 'tp4q3e.php';
        afficheCode(['tp4q3f.php', 'tp4q2f.php', 'tp4q3.php'], true, 'tp4q3.php', true, 'La fonction définie à l\'exercice précédent est utilisée pour s\'assurer que la valeur de la variable <code>$a</code> soit plus grande ou égale à celle de <code>$b</code> avant de commencer la boucle.');
        
        require 'tp4q4e.php';
        afficheCode(['tp4q4f.php', 'tp4q4.php'], true, 'tp4q4.php', true, 'La première ligne du triangle de Pascal est créée à part (<code>$p[] = [1];</code>). Voici comment sont produites les lignes suivantes :<ul><li>La première valeur est toujours 1 (<code>$ligne[0] = 1;</code>) ;</li><li>La dernière valeur est toujours 1 aussi (<code>$ligne[$i] = 1;</code>) ;</li><li>Pour les autres valeurs, il faut additionner deux valeurs de la ligne précédente<br>(<code>$ligne[$j] = $p[$i - 1][$j - 1] + $p[$i - 1][$j];</code>).</li></ul>Pour la méthode affichant le triangle de Pascal, la principale difficulté est d\'aligner les coefficients en colonnes. Les premières valeurs ne sont que sur un seul chiffre, mais dès la sixième ligne, il y a des coefficients sur deux chiffres…<br>La valeur la plus grande d\'un triangle de Pascal est située au milieu de la dernière ligne. Pour connaître le nombre de chiffres dans ce nombre, il est possible de faire appel au logarithme à base 10 (<a href="http://php.net/manual/fr/function.log10.php"><code>log10()</code></a>). La fonction <a href="http://php.net/manual/fr/function.floor.php"><code>floor()</code></a> effectue un arrondi à l\'entier inférieur.');
        ?>
    </body>
</html>