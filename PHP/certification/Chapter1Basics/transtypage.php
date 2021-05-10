<?php

//Conversion en entier
echo "Conversion en entier \n";
var_dump((int) "1");       
var_dump((int) "foo");       
var_dump((int) "2foo");       
var_dump((int) array(1,2,3));    //Comportement indéfini !!    
var_dump((int) null);       


//Conversion en boolean
echo "Conversion en boolean \n";
var_dump((bool) "");        // bool(false)
var_dump((bool) 1);         // bool(true)
var_dump((bool) -2);        // bool(true)
var_dump((bool) "foo");     // bool(true)
var_dump((bool) 2.3e5);     // bool(true)
var_dump((bool) array(12)); // bool(true)
var_dump((bool) array());   // bool(false)
var_dump((bool) "false");   // bool(true)

//Conversion des types en tableau
var_dump((array) 'foo bar');
var_dump((array) 1);
var_dump((array) null);
var_dump((array) array(1, 2, 3));
var_dump((array) array('foo' => 1, 'bar' => 2)); //ne fait rien

//Conersion des string
var_dump((string) 'foo bar');
var_dump((string) true);
var_dump((string) false);
var_dump((string) array(1,2,3)); //always "Array"
