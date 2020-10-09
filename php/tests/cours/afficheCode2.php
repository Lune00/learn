<?php

require_once 'getNumCorrection.php';

if (isset($correction) && $correction) {
    $numLab = getNumCorrection();
    echo '<input type="checkbox" class="cbxCorr" name="labCorr' . $numLab . '" id="labCorr' . $numLab . '"';
    if ($correction === 2) {
        echo ' checked';
    }
    echo '><div class="correction"><h4><label for="labCorr' . $numLab . '">Correction</label></h4><div class="corrige">';
}
foreach ($fichiers as $fichier) {
    if (isset($nomFichier) && $nomFichier) {
        if (isset($trunc) && $trunc > 0)
            $f = substr($fichier, $trunc);
        else
            $f = $fichier;
        echo '<h5 class="nom">' . $f . '</h5>';
    }
    echo preg_replace("#&nbsp;(.)#", ' $1', highlight_file($fichier, true));
}
if (isset($execution) && $execution) {
    echo '<h4 class="execution">Exécution</h4><div>';
    require $execution;
    echo '</div>';
}
if (isset($commentaires)) {
    if (!isset($nomCom)) {
        $nomCom = 'Commentaires';
    }
    echo '<h4 class="commentaires">' . $nomCom . '</h4>';
    echo '<div>' . $commentaires . '</div>';
}
if (isset($correction) && $correction) {
    echo '</div></div>';
}
