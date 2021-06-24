<?php

$a = array(
    array(1,2),
    array(3,4)
);

$aa = array(
    array(),
);


print_r(array_merge($a));
print_r(array_merge([], ...$a));