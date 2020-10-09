<?php
require_once './monProjet_MaClasse.class.php';
require_once './maLibrairieSpecifique_MaClasse.class.php';

// Déclaration d'une instance ma classe "maClasse" se trouvant dans le namespace MonProjet
$objProjet = new MonProjet\maClasse();
echo $objProjet->mafonction();
// Déclaration d'une instance ma classe "maClasse" se trouvant dans le namespace maLibrairieSpecifique
$objMaLivrairie = new maLibrairieSpecifique\maClasse();
echo $objMaLivrairie->mafonction();
