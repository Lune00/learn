<?php

// $foo = "Cheesburger";
// echo "I like $foo" . "\n";
// echo "I like ${foo}s". "\n";
// echo "I like {$foo}s". "\n";

// $catfood = new stdClass();
// $catfood->name = "Cheesburgers";
// $cat = new stdClass();
// $cat->canHas = [$catfood];
// // echo "$cat->canHas[0]->name"; //Notice array to string conversion
// echo "{$cat->canHas[0]->name}"; //mix array and object OK
// echo "$catfood->name"; // OK

// $a=array(1);
// echo "$a[0]";

//Ecoding and MultiByte Encoding
// $foo="éé";
// echo strlen($foo) . "\n";

// echo strcmp('foo','foo'). "\n";;

// $toto=false;
// echo (int) isset($toto);


// echo "\u{1F418}"; 
// echo "ello222\rtoto\v\t"; 

// echo mb_detect_encoding($foo);

// echo similar_text('toto', 'TOTO', $perc);
// echo $perc;


//Creer un match pattern avec la distance levenshtein sur la clef metaphone d'une phrase
//source : https://www.php.net/manual/fr/function.metaphone.php

$treshold = '20'; //Distance phonétique relative acceptable (en %) 
$target = 'Mon nom est rantanplan';
$user_search = 'rantanplan';

$distance = levenshtein(metaphone($target), metaphone($user_search));
$relative_phonetic_distance = (float)$distance / (float)mb_strlen(metaphone($target)) * 100.0;

// var_dump(mb_strlen(metaphone($target)), $distance, $proximity  );
var_dump($relative_phonetic_distance);
if ($relative_phonetic_distance < $treshold)
    echo "Cherchez-vous l'album '{$target}? (proximite phonetique: $relative_phonetic_distance)'\n";




$string ='une string';

echo substr('abcdef', 2) . PHP_EOL;
echo substr('abcdef', -2) . PHP_EOL;