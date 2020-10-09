<?php
$array = array('truc' => 'machin', 'chose' => 8, 9 => 'yeah !');
$serial = serialize($array);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
