<?php
$float = 3.14159265359;
$serial = serialize($float);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
