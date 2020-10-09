<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Hello World !</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Hello World</h1>
        <h4 class="execution">Execution</h4>
        <div>
            <?php
            echo '<em>Hello World !</em>';
            echo '<p>Bonjour ' . 'Valérie ' . '!</p>';
            ?>
            <p>
                <?= 'Bonjour Mélanie !' ?>
            </p>
            <p>
                <?php
                // Eventuellement cette syntaxe
                echo('Bonjour Olivier !'); /* syntaxe comme si écho était
                  une fonction */
                #autre commentaire
                ?>
                <?php
                
                ?>
            </p>
        </div>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>
