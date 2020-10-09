<?php
$cb = ["1234 5678 9012 3456", "1234 5678 912 3456", "1234567890123456"];
$cbOk = "#^(\d{4}\s*){4}$#";
foreach ($cb as $num) {
    if (preg_match($cbOk, $num)) {
        echo $num . ' est un numéro de CB correct<br>';
    } else {
        echo $num . ' n\' est pas un numéro de CB correct<br>';
    }
}
