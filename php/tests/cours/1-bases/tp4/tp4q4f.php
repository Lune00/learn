<?php
function trianglePascal($taille) {
    $p[] = [1];
    for ($i = 1; $i < $taille; $i++) {
        $ligne[0] = 1;
        for ($j = 1; $j < $i; $j++)
            $ligne[$j] = $p[$i - 1][$j - 1] + $p[$i - 1][$j];
        $ligne[$i] = 1;
        $p[] = $ligne;
    }
    return $p;
}

function afficherTrianglePascal($taille) {
    $pascal = trianglePascal($taille);
    $nbChiffres = floor(log10($pascal[$taille - 1][$taille / 2])) + 2;
    $format = '%' . $nbChiffres . 'd';
    echo '<pre>';
    foreach ($pascal as $ligne) {
        foreach ($ligne as $coef) {
            printf($format, $coef);
        }
        echo '<br>';
    }
    echo '</pre>';
}
