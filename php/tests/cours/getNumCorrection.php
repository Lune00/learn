<?php
function getNumCorrection() {
    static $numLab = 0;
    return $numLab++;
}
