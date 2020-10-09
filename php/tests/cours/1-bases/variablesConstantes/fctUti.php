<?php
var_dump($une_variable);
echo '<p>isset() : La variable <code>$une_variable</code> est elle définie ? <p>';
var_dump(isset($une_variable));
echo '<p>empty() : La variable <code>$une_variable</code> est elle vide ?</p>';
var_dump(empty($une_variable));
echo '<p>unset() Suppression de la variable <code>$une_variable</code><br>';
unset($une_variable);
echo 'La variable <code>$une_variable</code> est elle définie ? </p>';
var_dump(isset($une_variable));
