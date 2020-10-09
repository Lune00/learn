<?php
require_once '../classes/VilleCtr.class.php';

$sh = new VilleCtr('Saint-herblain', 'Loire-Atlantique');
echo $sh;

$cb = new VilleCtr('Chartres de Bretagne', 'Ille et Vilaine');
echo $cb;
