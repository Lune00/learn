<?php 




$message = 'Hello';
$message .= NULL;

class Toto{


}

$toto = new Toto();

echo $message;

if($toto){
    echo "Object exists!";
}