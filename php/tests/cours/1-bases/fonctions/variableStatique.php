<?php
function variableStatique() {
    $variable = 0;
    static $variable_statique = 0;

    $variable++;
    echo "Variable : $variable <br>";

    $variable_statique++;
    echo "Variable statique : $variable_statique <br>";
}

variableStatique();
variableStatique();
variableStatique();
