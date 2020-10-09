<?php
$array = array(0, 4, 7, 3);
$serial = serialize($array);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
