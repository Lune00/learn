<?php
if (isset($_POST['ok'])) {
    $nom = filter_input(INPUT_POST, 'nom', FILTER_SANITIZE_STRING);
    $message = '';
    if (!$nom) {
        $message .= "Le nom doit obligatoirement être renseigné !<br>";
    }
    //filtre de vérification du mot de passe
    $filtreMDP = array(
        'filter' => FILTER_VALIDATE_REGEXP,
        'options' => array('regexp' => '#^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$#')
    );

    $filtre = array(
        'age' => FILTER_VALIDATE_INT,
        'email' => FILTER_VALIDATE_EMAIL,
        'mdp' => $filtreMDP,
    );
    foreach (filter_var_array($_POST['saisie'], $filtre) as $champ => $valeur) {
        if (!$valeur) {
            $message .= "Le champ " . $champ . " ne respecte pas les règles imposées<br>";
        }
    }
    if (!$message) {
        //chargement de la photo
        if (!$_FILES['photo']['error']) {
            if (copy($_FILES['photo']['tmp_name'], 'photos/' . $nom . '.jpg')) {
                header('location: confirmation.php');
                exit();
            } else {
                $message .= "pb de copie<br>";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>Formulaire traitement intégré</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="execution">Formulaire traitement intégré</h1>
        <div>
            <form action="#" method="POST" enctype="multipart/form-data">
                <!--enctype="multipart/form-data" pour l'uplaod du fichier-->
                <?php
                if (isset($message)) {
                    echo $message;
                }
                ?>
                <label for="idNom">Nom : </label><input type="text" name="nom" id="idNom"<?php
                if (isset($_POST['nom'])) {
                    echo ' value="' . $nom . '"';
                }
                ?>><br>
                <label for="idAge">Âge : </label><input type="number" name="saisie[age]" id="idAge"<?php
                if (isset($_POST['saisie'])) {
                    echo ' value="' . $_POST['saisie']['age'] . '"';
                }
                ?>><br>
                <label for="idMail">E-Mail : </label><input type="email" name="saisie[email]" id="idMail"<?php
                if (isset($_POST['saisie'])) {
                    echo ' value="' . $_POST['saisie']['email'] . '"';
                }
                ?>><br>
                <label for="idMdp">Mot de passe : </label>
                <input type="text" name="saisie[mdp]"
                       title="8 caractères minimum avec au moins une majuscule, une minuscule et un chiffre"
                       pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}" required id="idMdp"><br>
                <label for="idPho">Photo : </label><input type="file" name="photo" id="idPho"><br>
                <input type="submit" name="ok" value="OK">
            </form>
        </div>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>