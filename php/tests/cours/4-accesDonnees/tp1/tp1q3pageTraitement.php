<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 3</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Requêter une base de données</h1>
        <h2>Page de traitement</h2>
        <?php
        $enregistrer = filter_input(INPUT_POST, 'Enregistrer',
                                    FILTER_SANITIZE_STRING);
        $id_pers = filter_input(INPUT_POST, 'NumroDiden', FILTER_VALIDATE_INT);
        $nom = filter_input(INPUT_POST, 'NomDeFamil', FILTER_SANITIZE_STRING);
        $prenom = filter_input(INPUT_POST, 'Prnom', FILTER_SANITIZE_STRING);
        $adresse = filter_input(INPUT_POST, 'Adresse', FILTER_SANITIZE_STRING);
        $cp = filter_input(INPUT_POST, 'CodePostal', FILTER_VALIDATE_REGEXP,
                                    ['options' => ['regexp' => '#^\d{5}$#']]);
        $ville = filter_input(INPUT_POST, 'Ville', FILTER_SANITIZE_STRING);
        $ok = false;

        if ($enregistrer && $id_pers && $nom && $prenom && $adresse && $cp &&
                                                                    $ville) {
            require_once './tp1cnx.php';

            $prep = $pdo->prepare('UPDATE proprietaires SET nom=:nom, '
                    . 'prenom=:prenom, adresse=:adresse, codepostal=:cp, '
                    . 'ville=:ville WHERE id_pers=:id_pers;');
            $prep->bindValue(':id_pers', $id_pers);
            $prep->bindValue(':nom', $nom);
            $prep->bindValue(':prenom', $prenom);
            $prep->bindValue(':adresse', $adresse);
            $prep->bindValue(':ville', $ville);
            $prep->bindValue(':cp', $cp);
            $rep = $prep->execute();

            if ($rep) {
                echo '<div>Vos données ont bien été mises à jour</div>';
                $ok = true;
            }
        }
        if (!$ok) {
            echo '<div>Désolé mais vos données n\'ont pas pu être mises '
            . 'à jour</div>';
        }
        ?>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>
