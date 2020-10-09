<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 5 : Expression rationnelles</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 5 : Expression rationnelles</h1>
        <h2 class="dif1">Question 1</h2>
        <section class="enonce">Créer une expression rationnelle de validation d'un numéro de carte bancaire.
        Ce numéro est composé de seize chiffres éventuellement groupés par quatre.</section>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['tp5q1.php'], false, 'tp5q1.php', true, 'La classe <code>\\d</code> correspond à un chiffre. Le quantifieur <code>{4}</code> indique que cette classe est répétée quatre fois. Cela correspond donc à un groupe de quatre chiffres.<br>La classe <code>\\s</code> correspond à blanc (espace, tabulation ou retour à la ligne). Le quantifieur <code>*</code> indique qu\'il peut y en avoir entre zéro et l\'infini.<br>Tout ce qui vient d\'être cité est regroupé par un couple de parenthèses. Ce groupe est suivi du quantifieur <code>{4}</code> indiquant que ce groupe doit être répété quatre fois.<br>La fonction <a href="http://php.net/manual/fr/function.preg-match.php"><code>preg_match()</code></a> permet de tester l\'adéquation d\'une chaîne de caractères avec une expression rationnelle.');
        ?>
        <h2 class="dif2">Question 2</h2>
        <section class="enonce">Créer une expression rationnelle de validation d'une adresse HTTP.<br>
            Le modèle doit répondre à la définition suivante :
            <ol>
                <li>Commencer par &laquo;&nbsp;www.&nbsp;&raquo;</li>
                <li>Être suivi par des lettres puis éventuellement un point ou un tiret suivis d'un deuxième groupe de lettres</li>
                <li>Se terminer par un point suivi de l'extension qui peut avoir de 2 à 4 caractères.</li>
            </ol>  
            Par exemple, les adresses www.machin.com ou www.machintruc.uk sont valides.
        </section>
        <?php
        afficheCode(['tp5q2.php'], false, 'tp5q2.php', true, 'Les caractères <code>^</code> et <code>$</code> indiquent le début et la fin de la ligne.<br>Le caractère <code>w</code> se représente lui-même. Le quantifieur <code>{3}</code> indique que trois w sont nécessaires.<br>Le caractère suivant doit être un point. Mais le point a une signification particulière (n\'importe quel caractère), il est donc échappé avec un caractère <code>\\</code>.<br>L\'ensemble <code>[a-zA-Z]</code> correspond à un caractère parmi l\'intervalle a à z ou parmi l\'intervalle A à Z, c\'est-à-dire une lettre majuscule ou minuscule. Le quantifieur <code>+</code> indique qu\'il doit être présent au moins une fois.<br>L\'ensemble <code>[\-\.]</code> correspond à un tiret ou un point. Ces deux caractères ont également été échappés (le tiret est utilisé comme vu ci-dessus pour les intervalles). Ensuite, il doit y avoir à nouveau une ou plusieurs lettres.<br>Tout ce qui vient d\'être cité est regroupé par un couple de parenthèses. Ce groupe est suivi du quantifieur <code>?</code> indiquant que ce groupe est optionnel.<br>Enfin, il doit à nouveau y avoir un point. Et le quantifieur <code>{2,4}</code> indique que ce point doit être suivi par entre deux et quatre lettres.');
        ?>
        <h2 class="dif2">Question 3</h2>
        <section class="enonce">Créer une expression rationnelle permettant de remplacer les caractères \n par la balise &lt;br&gt;.</section>
        <?php
        afficheCode(['tp5q3.php'], false, 'tp5q3.php', true, 'La fonction <a href="http://php.net/manual/fr/function.preg-replace.php"><code>preg_replace()</code></a> permet de rechercher un motif et de modifier la valeur des occurrences trouvées.<br>Le motif à rechercher est <code>\\n</code>. Tout d\'abord, il faut ajouter doubler le <code>\\</code> car dans une expression rationnelle, le caractère <code>\\</code> est le caractère d\'échappement. Si l\'expression doit réellement contenir ce caractère, il faut le doubler. Mais le caractère <code>\\</code> est également le caractère d\'échappement des chaînes de caractères, il faut donc le tripler.<br>Il est à noter que la fonction <a href="http://php.net/manual/fr/function.nl2br.php"><code>nl2br()</code></a> effectue ce travail.  Il est bien évidemment préférable de ne pas recoder ce qui existe déjà !');
        ?>
        <h2 class="dif3">Question 4</h2>
        <section class="enonce">Transformer un extrait d'une page Wikipédia en syntaxe WIKI en du texte au format HTML.<br>La documentation de la syntaxe WIKI est disponible sur la page <a href="https://fr.wikipedia.org/wiki/Aide:Syntaxe">https://fr.wikipedia.org/wiki/Aide:Syntaxe</a>.<br>Ne se préoccuper que des éléments suivants :
            <ul>
                <li>Mises en forme (gras, italique)</li>
                <li>Titres</li>
                <li>Images (pour les très forts !)</li>
                <li>Liens (pour les très forts également !)</li>
            </ul>
            Exemple d'un extrait d'une page wikipedia (<a href="https://fr.wikipedia.org/wiki/PHP">https://fr.wikipedia.org/wiki/PHP</a>) :<br>
            <code>== Histoire ==<br>
                Le langage PHP fut créé en [[1994]] par [[Rasmus Lerdorf]] pour son [[site web]]. C'était à l'origine une [[bibliothèque logicielle]] en [[C (langage)|C]] dont il se servait pour conserver une trace des visiteurs qui venaient consulter son [[Curriculum vitæ|CV]]. Au fur et à mesure qu'il ajoutait de nouvelles fonctionnalités, Rasmus a transformé la bibliothèque en une implémentation capable de communiquer avec des bases de données et de créer des applications dynamiques et simples pour le [[World Wide Web|Web]]. Rasmus décida alors en [[1995]] de publier son code, pour que tout le monde puisse l'utiliser et en profiter. PHP s'appelait alors PHP/FI (pour '''''P'''ersonal '''H'''ome '''Pa'''ge Tools/'''F'''orm '''I'''nterpreter''). En [[1997]], deux étudiants, [[Andi Gutmans]] et [[Zeev Suraski]], redéveloppèrent le cœur de PHP/FI. Ce travail aboutit un an plus tard à la version 3 de PHP, devenu alors ''PHP: Hypertext Preprocessor''. Peu de temps après, Andi Gutmans et Zeev Suraski commencèrent la réécriture du moteur interne de PHP. Ce fut ce nouveau moteur, appelé ''[[Zend Engine]]'' — le mot ''Zend'' est la contraction de '''''Ze'''ev'' et ''A'''nd'''i'' — qui servit de base à la version 4 de PHP.<br>
                <br>
                === Utilisations ===<br>
                [[Image:Server-side websites programming languages.PNG|thumb|Répartition des langages de programmation côté serveur des sites web, le 28 avril 2016.]]<br>
                En [[2002]], PHP est utilisé par plus de 8 millions de sites Web à travers le monde, en [[2007]] par plus de 20 millions et en 2013 par plus de 244 millions.</code>
        </section>
        <?php
        afficheCode(['tp5q4.php'], false, 'tp5q4.php', true, '<h5>Mises en forme</h5>Les éléments en gras ou en italique sont entourés par des apostrophes. Deux pour l\'italique et trois pour le gras. Il faut commencer par rechercher d\'abord le texte entouré de trois apostrophes car deux apostrophes sont un cas particulier de trois apostrophes.<br>Pour effectuer ce premier remplacement, la fonction <a href="http://php.net/manual/fr/function.preg-replace.php"><code>preg_replace()</code></a> est utilisée avec le motif <code>\'#\\\'\\\'\\\'([^\\\']+)\\\'\\\'\\\'#\'</code>. Ce motif correspond à trois apostrophes, au moins un caractère qui n\'est pas un apostrophe (le groupe commence par le caractère <code>^</code> correspondant à « tout sauf ») puis trois apostrophes. Une paire de parenthèses a été positionnée autour du texte à mettre en gras. Cela permet de capturer cette valeur et de pourvoir la réutiliser dans le texte de remplacement. Ce texte est constitué d\'une balise <code>&lt;b&gt;</code>, du texte capturé et d\'une balise fermante <code>&lt;/b&gt;</code>. Pour récupérer le texte capturé, il faut utiliser le symbole $ suivi du numéro du groupe capturé. Dans ce cas-ci, il n\'y en a qu\'un seul, c\'est donc <code>$1</code>.<br>Pour l\'italique, il faut procéder de manière similaire avec une apostrophe de moins et la balise <code>&lt;i&gt;</code>.<h5>Titres</h5>Il serait possible de procéder de manière similaire pour les titres en commençant par le titre de plus petit niveau ayant donc le plus de signes égal. Cela se réaliserait avec l\'instruction suivante : <code>$texte = preg_replace(\'#====== ([^=]+) ======#\', \'&lt;h6&gt;$1&lt;/h6&gt;\', $texte);</code> puis il faudrait procéder de même pour les titres de niveau 5 jusqu\'au niveau 1. Ce qui produirait six instructions similaires (heureusement qu\'il n\'y a pas 100 niveaux de titre !).<br>La fonction <a href=http://php.net/manual/fr/function.preg-replace-callback.php"><code>preg_replace_callback()</code></a> permet d\'évider cela. Cette fonction prend en paramètre une fonction qui sera appelée sur tous les textes correspondants au motif recherché. Dans le cas des titres, le motif recherché est <code>\'#(={1,6}) (.+?) (={1,6})#\'</code>. Cela correspond à entre un et six signes égal puis des caractères et encore entre un et six signes égal. Le quantifieur <code>+?</code> signifie au moins un mais le moins possible (le quantifieur <code>+</code> seul prend par défaut le plus de caractères possibles). Cela permet de s\'arrêter aux signes égal correspondant à la fin de ce titre.<br>La fonction passée en paramètre doit prendre en paramètre un tableau. Pour chaque texte correspondant au motif, deux groupes sont capturés, les signes égal avant le titre et le titre lui-même. Ces valeurs capturées sont positionnées dans le tableau à partir de la case 1 (la case 0 contient l\'ensemble du texte correspondant au motif).<br>Dans cette situation, pour les titres, une fonction anonyme est utilisée. Dans celle-ci, l\'instruction <code>$nb = strlen($matches[1]);</code> permet de compter le nombre de signes égal. La fonction retourne une chaîne de caractères avec la bonne balise HTML de titre et le titre récupéré.');
        ?>
    </body>
</html>