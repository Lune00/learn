<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Formulaire traitement à part</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="execution">Formulaire traitement à part</h1>
        <div>
            <form action="formulaireTraitement.php" method="POST"> <!--method="GET" à tester également-->
                <label for="idNom">Nom : </label><input type="text" name="nom" id="idNom"><br>
                <label for="idAge">Âge : </label><input type="number" name="saisie[age]" id="idAge"><br>
                <label for="idMail">E-Mail : </label><input type="email" name="saisie[email]" id="idMail"><br>
                <label for="idMdp">Mot de passe : </label>
                <input type="password" name="saisie[mdp]"
                       title="8 caractères minimum avec au moins une majuscule, une minuscule et un chiffre"
                       required id="idMdp" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}"><br>
                <input type="submit" name="ok" value="Valider">
            </form>
        </div>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>