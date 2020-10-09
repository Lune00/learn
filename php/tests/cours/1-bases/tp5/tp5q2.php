<?php
$urls = array('www.machin.com', 'www.machintruc.uk', 'ww.machin.com', 'www.machin.bidule.com', 'www.machin-b.com', 'www.machin-truc-bidule.uk', 'ww.machin-truc.com', 'www.machin.bidule.chose');

foreach ($urls as $url) {
    if (preg_match('#^w{3}\.[a-zA-Z]+([\-\.][a-zA-Z]+)?\.[a-zA-Z]{2,4}$#', $url)) {
        echo $url . ' est une URL valide<br>';
    } else {
        echo $url . ' <- NON VALIDE !<br>';
    }
}
