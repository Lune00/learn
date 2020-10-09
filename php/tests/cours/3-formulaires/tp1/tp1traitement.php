<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 - Traitement</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1</h1>
        <h2>Page de traitement</h2>
        <table>
            <tr>
                <th>nom</th>
                <th>prénom</th>
                <th>adresse</th>
                <th>code postal</th>
                <th>ville</th>
            </tr>
            <tr>
                <td><?=filter_var($_POST['Nom'], FILTER_SANITIZE_STRING)?></td>
                <td><?=filter_input(INPUT_POST, 'Prnom', FILTER_SANITIZE_STRING)?></td>
                <td><?=$_POST['Adresse']?></td>
                <td><?=filter_input(INPUT_POST, 'Cp', FILTER_SANITIZE_NUMBER_INT)?></td>
                <td><?=$_POST['Ville']?></td>
            </tr>
        </table>
        <h2>Code de la page :</h2><?php highlight_file(__FILE__); ?>
    </body>
</html>
