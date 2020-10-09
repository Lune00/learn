<?php
require_once '../classes/Distance.class.php';


for ($i = 1; $i > -3; $i--) {
    try {
        echo '*** Création d\'une distance de ' . $i . ' ***<br>';
        $d1 = new Distance($i);
        echo 'La distance a été créée sans qu\'aucune exception n\'ait été levée<br>';
    } catch (Exception $e) {
        echo 'Une exception a été levée et récupérée :<br>';
        echo 'Numéro de l\'erreur : ' . $e->getCode() . '<br>';
        echo 'Message : ' . $e->getMessage() . '<br>';
    } finally {
        echo 'Qu\'une exception ait été levée ou pas de toutes les façons ce code sera exécuté<br>';
    }
}
