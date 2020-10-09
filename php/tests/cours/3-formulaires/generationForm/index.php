<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Formulaire généré</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="execution">Formulaire traitement à part</h1>
        <div>
            <form action="formulaireTraitement.php" method="GET"> <!--method="GET" à tester également-->
                <h3>Disponibilités :</h3>
                <label for="idJour">Jour : </label>
                <select id="idJour" name="jour">
                    <?php
                    $jours = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi'];
                    foreach ($jours as $numero => $nomJour) {
                        echo '<option value="' . $numero . '">' . $nomJour . "</option>";
                    }
                    ?>
                </select><br>
                <h3>Cours souhaités :</h3>
                <?php
                $cours = ['PHP', 'HTML', 'JavaScript', 'MySQL', 'CSS'];
                foreach ($cours as $c) {
                    echo '<input id="id' . $c . '" type="checkbox" name="' . $c . '"><label for="id' . $c . '">' . $c . '</label><br>';
                }
                ?>
                <input type="submit" value="Ok" name="btnValider">
            </form>
        </div>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>
