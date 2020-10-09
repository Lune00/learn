<?php
require_once './tp1cnx.php';
$ok = filter_input(INPUT_POST, 'ok', FILTER_SANITIZE_STRING);

if ($ok) {
    try {
        $prep = $pdo->prepare('UPDATE voitures SET immat=:newImmat, '
                . 'id_modele=:id_modele, couleur=:couleur, '
                . 'dateVoiture=:dateVoiture WHERE immat=:oldImmat;');
        $filtreDate = [
            'filter' => FILTER_VALIDATE_REGEXP,
            'options' => ['regexp' => '#^\d{4}\-\d{2}\-\d{2}$#']
        ];
        $filtreCouleur = [
            'filter' => FILTER_VALIDATE_REGEXP,
            'options' => ['regexp' => '#^CL|MO|FO$#']
        ];
        $filtre = [
            'immat' => FILTER_SANITIZE_STRING,
            'modele' => FILTER_SANITIZE_STRING,
            'couleur' => $filtreCouleur,
            'date' => $filtreDate];

        foreach ($_POST as $immat => $valeurs) {
            if (is_array($valeurs)) {
                $valeurs = filter_var_array($valeurs, $filtre);
                $prep->bindValue(':newImmat', $valeurs['immat']);
                $prep->bindValue(':id_modele', $valeurs['modele']);
                $prep->bindValue(':couleur', $valeurs['couleur']);
                $prep->bindValue(':dateVoiture', $valeurs['date']);
                $prep->bindValue(':oldImmat', $immat);
                $prep->execute();
            }
        }
        echo 'La modification de '.date('H\hi').' a été effectuée avec succès';
    } catch (PDOException $e) {
        echo 'La modification n\'a pu être effectuée';
    }
}

$modeles = $pdo->query('SELECT id_modele id, CONCAT(marque, \' \', modele, \' '
        . '(\', carburant,\')\') valeur FROM modeles;')->fetchAll();

$couleurs = [
    ['id' => 'CL', 'valeur' => 'de couleur claire'],
    ['id' => 'MO', 'valeur' => 'de couleur intermédiaire'],
    ['id' => 'FO', 'valeur' => 'de couleur foncée']
];

function choix($tabValeurs, $nom, $select, $immat) {
    echo '<select name="' . $immat . '[' . $nom . ']">';
    foreach ($tabValeurs as $ligne) {
        echo '<option value="' . $ligne['id'] . '"';
        if ($ligne['id'] === $select)
            echo ' selected';
        echo '>' . $ligne['valeur'] . '</option>';
    }
    echo '</select>';
}
?>
<form action="#" method="POST">
    <table>
        <tr>
            <th>immatriculation</th>
            <th>modèle</th>
            <th>couleur</th>
            <th>date de première immatriculation</th>
        </tr>
        <?php
        $voitures = $pdo->query('SELECT * FROM voitures;')->fetchAll();
        foreach ($voitures as $ligne):
            ?>
            <tr>
                <td><input type="text" name="<?= $ligne['immat'] ?>[immat]"
                           value="<?= $ligne['immat'] ?>"></td>
                <td><?php choix($modeles, 'modele', $ligne['id_modele'],
                        $ligne['immat']) ?></td>
                <td><?php choix($couleurs, 'couleur', $ligne['couleur'],
                        $ligne['immat']) ?></td>
                <td><input type="date" name="<?= $ligne['immat'] ?>[date]"
                           value="<?= $ligne['datevoiture'] ?>"></td>
            </tr>
        <?php endforeach; ?>
    </table>
    <input type="submit" value="Enregistrer les modifications" name="ok">
</form>