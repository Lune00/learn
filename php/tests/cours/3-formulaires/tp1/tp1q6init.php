<?php
require_once './fctCalendrier.php';
if (isset($_GET['Ok'])) {
    $m = filter_input(INPUT_GET, 'mois', FILTER_SANITIZE_NUMBER_INT);
    $a = filter_input(INPUT_GET, 'annee', FILTER_SANITIZE_NUMBER_INT);
} else {
    $m = date('n');
    $a = date('Y');
}
