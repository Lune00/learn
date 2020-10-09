<form action="" method="POST">
    <label for="idNom">Login :</label>
    <input type="text" id="idNom"name="nom"
            <?= $nom ? ' value="' . $nom . '"' : '' ?>><br>
    <label for="idMdp">Mot de passe :</label>
    <input type="password" id="idMdp" name="mdp"
            <?= $idp ? ' value="' . $idp . '"' : '' ?>><br>
    <label>Conserver ces informations pendant</label>
    <input type="number" name="dur"> jours<br>
    <input type="submit" value="se connecter">
</form>
