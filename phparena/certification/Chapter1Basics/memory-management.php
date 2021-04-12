<?php

// $a = "new string";
// $b = $c = $a;
// xdebug_debug_zval( 'a' );
// xdebug_debug_zval( 'b' );

// $a='new string';
// $b=&$a;
// xdebug_debug_zval('a');
// xdebug_debug_zval('b');
// $a = array( 'meaning' => 'life', 'number' => 42 );
// xdebug_debug_zval( 'a' );
// $i=42;
// xdebug_debug_zval( 'i' );
// $i=42;
// $j=$i;
// $k=$i;
// xdebug_debug_zval( 'i' );

// $a=array(1,2);
// xdebug_debug_zval( 'a' );

// $a = array( 'one' );
// $a[] =& $a;
// xdebug_debug_zval( 'a' );

//??? How the differences are managed in terms of zval
//https://stackoverflow.com/questions/66707410/do-two-arrays-share-the-same-zval-containers-they-have-in-common
$a=array(1,2,3);
$b= $a;
$b[0] = 'foo';
$b[] = 'bar';
xdebug_debug_zval( 'a' );
xdebug_debug_zval( 'b' );
