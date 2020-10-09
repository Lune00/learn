<form action="" method="POST">
    <label for="idNom">Nom de famille :</label>
    <input type="text" id="idNom"name="nom"
            <?= $nom ? ' value="' . $nom . '"' : '' ?>><br>
    <label for="idP">Numéro d'identification :</label>
    <input type="number" id="idP" name="idP"
            <?= $idp ? ' value="' . $idp . '"' : '' ?>><br>
    <label>Conserver ces informations pendant</label>
    <input type="number" name="dur"> jours<br>
    <input type="submit" value="se connecter">
</form>
