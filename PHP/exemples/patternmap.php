<?php

const KEYS = array(
    'title' => 'WeirdKey',
    'subtitle' => 'AnotherWeirdKey',
    '' => 'choux blanc'
);

var_dump(KEYS);
var_dump(KEYS['chou'] ?? 'nothing');
var_dump(KEYS[''] ?? 'noting');


$test = array(
    'foo' => array(
        'bar' => array(
            'baz'
        )
    )
);


var_dump($test['foo']['bar'] ?? 'nope');