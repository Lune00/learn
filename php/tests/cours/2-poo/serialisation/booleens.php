<?php
$bool = false;
$serial = serialize($bool);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
