<?php
var_dump(filter_var_array($_POST['saisie'], FILTER_VALIDATE_INT));
var_dump(filter_input_array(INPUT_POST, FILTER_VALIDATE_INT));
