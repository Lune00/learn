<?php
if (setcookie('prenom', 'François-Marie', time() + (30 * 24 * 3600)))
    echo 'OK<br>';
else
    echo 'ECHEC !<br>';
