<?php
$motif = '#^([0-9]{1,2})/([0-9]{1,2})/([0-9]{4})$#';
$avant = "01/04/2014";
$apres = preg_replace($motif, "$3-$2-$1", $avant);
echo $avant . ' > ' . $apres;
