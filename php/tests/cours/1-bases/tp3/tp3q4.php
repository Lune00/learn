<?php
$maintenant = time();
$naissance = mktime(23, 15, 00, 6, 2, 1982);
echo number_format($maintenant - $naissance, 0, '.', ' ') . ' secondes vécues';
