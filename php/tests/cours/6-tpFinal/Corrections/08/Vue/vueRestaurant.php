<?php
$this->titre = 'Restaurants Préférés -' . $r['nom'];
?>

<h1><?= $r['nom'] ?></h1>
<address><?= $r['adresse'] . '<br>' . $r['cp'] . ' ' . $r['ville'] ?></address>
<?= chunk_split(sprintf("%'.010d", $r['telephone']), 2, ' ') ?>
<h2>Description</h2>
<?= $r['description'] ?>
<h2>Avis</h2>
<?php
foreach ($avis as $a) :
    $auteur = $a['auteur'];
    if (!$auteur) {
        $auteur = '<i>anonyme</i>';
    }
    ?>
    <span><?php
        echo $auteur . ' : ';
        for ($i = 0; $i < $a['note']; $i++):
            ?>
            <img src="Media/etoile.png" alt="*">
            <?php
        endfor;
        while ($i < 5):
            ?>
            <img src="Media/pasetoile.png" alt="">
            <?php
            $i++;
        endwhile;
        ?></span>
    <p><?= $a['commentaire'] ?></p>
<?php
endforeach;
