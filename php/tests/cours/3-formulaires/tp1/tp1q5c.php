<?php
$choixImmo = filter_input(INPUT_GET, 'btnImmo', FILTER_SANITIZE_STRING);
if ($choixImmo) {
    header('location: ' . $choixImmo . '.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 question 5</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : Formulaires</h1>
        <h2>Question 5</h2>
        <section class="enonce">Dans la perspective de la création d'un site d'agence immobilière,
            créer un formulaire comprenant trois boutons de soumission nommés &laquo;&nbsp;Vendre&nbsp;&raquo;,
            &laquo;&nbsp;Acheter&nbsp;&raquo; et &laquo;&nbsp;Louer&nbsp;&raquo;.
            En fonction du choix effectué par le visiteur, le rediriger vers une page spécialisée
            correspondante.<br>Il est bien à noter que ceci est un exercice pour apprendre à maîtriser
            les formulaires et les redirections. Dans « la vraie vie », il serait préférable d'utiliser
            une balise de lien hypertexte.</section>
        <h4 class="execution">Exécution</h4>
        <div>
            <form action="" method="GET">
                <fieldset><legend>Vous souhaitez...</legend>
                    <input type="submit" name="btnImmo" value="Acheter" >
                    <input type="submit" name="btnImmo" value="Vendre" >
                    <input type="submit" name="btnImmo" value="Louer" >
                </fieldset>
            </form>
        </div>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['tp1q5c.php'], true, false, true, 'Si le formulaire n\'a jamais été posté alors, il s\'affiche.<br>Les trois boutons de soumission du formulaire portent tous le même nom « btnImmo ». Si le formulaire a été posté, en fonction de la valeur associée à ce paramètre (donc en fonction du bouton cliqué), une redirection est effectuée vers la page portant ce nom.');
        ?>
    </body>
</html>
