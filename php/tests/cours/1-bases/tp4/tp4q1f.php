<?php
function nbEssaisPour($cible) {
    $nbTentatives = 0;
    while (rand(0, 999) != $cible)
        $nbTentatives++;
    return $nbTentatives;
}