<form action="#" method="GET">
    <?php
    $couleurs = ['inherit' => 'Défaut', 'white' => 'Blanc', 'red' => 'Rouge',
        'green' => 'Vert', '#6666FF' => 'Violet', 'black' => 'Noir'];

    foreach (array('background', 'color') as $propriete) {
        echo '<label for="' . $propriete . '">'
        . ($propriete === 'background' ? 'Fond' : 'Texte') . ' :</label>'
        . '<select name="' . $propriete . '" id="' . $propriete . '">';
        foreach ($couleurs as $code => $libelle) {
            echo '<option value="' . $code . '"';
            if (isset($$propriete) && $code === $$propriete)
                echo ' selected';
            echo '>' . $libelle . '</option>';
        }
        echo '</select><br>';
    }
    ?>
    <input type="submit" value="changer">
</form>
