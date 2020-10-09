<?php
$chaine = 'Frédéric dit : "j\'ai faim !"';
$serial = serialize($chaine);
echo '<code>' . gettype($serial) . ' : <span class="red">\'' . $serial . '\'</span></code>';
var_dump(unserialize($serial));
