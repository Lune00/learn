<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Les redirection</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Saisie du nom</h1>
        <div>
            <form action="redirCond.php" method="POST">
                <label for="idNom">Nom : </label><input type="text" name="nom" id="idNom">
                <input type="submit" name="ok" value="Valider">
            </form>
        </div>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>