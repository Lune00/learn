<?php
$this->titre = 'Restaurant - ' . $r['nom'];
?>
<h1><?= $r['nom'] ?></h1>
<address><?= $r['adresse'] . '<br>' . $r['cp'] . ' ' . $r['ville'] ?></address>
<?= chunk_split(sprintf("%'.010d", $r['telephone']), 2, ' ') ?>
<h2>Description</h2>
<?= $r['description'] ?>
<h2>Avis</h2>
<?php
foreach ($lesAvis as $avis) {
    $auteur = $avis['auteur'];
    if (!$auteur)
        $auteur = '<i>anonyme</i>';
    echo $auteur . ' : ';
    for ($i = 0; $i < $avis['note']; $i++)
        echo '<img src="Media/etoile.png" alt="*">';
    for ($i = $avis['note']; $i < 5; $i++)
        echo '<img src="Media/pasetoile.png" alt="">';
    echo '<p>' . $avis['commentaire'] . '</p>';
}
