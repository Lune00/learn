<?php
$mails = ['jean@eni.fr', 'fred@linux.net', 'lea@renault.fr', 'caroline@eni.fr',
    'contact@eni-ecole.fr', 'valentina@ferrari.it', 'melanie@eni-ecole.fr',
    'philippe@eni.fr', 'typhaine@belfort.fr', 'louis@leparisien.fr'];
foreach ($mails as $m) {
    $d = explode('@', $m)[1];
    if (isset($domaines[$d])) {
        $domaines[$d] ++;
    } else {
        $domaines[$d] = 1;
    }
}
var_dump($domaines);
