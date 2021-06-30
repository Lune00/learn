<?php

/**
 * Filtrer données en entrée : empecher des mauvaises données de rentrer dans l'app, peu importe sa source externe
 *  - identifier les inputs
 *  - filtrer les inputs
 *  - distinguer entre les données filtrées et celles qui ne le sont pas
 */

/**
 * Guidelines:
 * - ne jamais tenter de corriger des inputs invalides, forcer l'user a jouer avec nos regles (ex: ne pas enlever des caracteres non admis, juste refuser)
 * - penser le filtre comme un processus d'inspection et non de correction. Utiliser une liste blanche a chaque fois que c'est possible.
 * - mieux vaut considérer une donnée invalide alors qu'elle est valide que de considérer une donnée valide alors qu'elle ne l'est pas
 */


/**
 * Par exemple, si on veut s'assurer qu'une chaine input ne contienne pas de . ou de /, tester s'il y'en a . Si oui, refuser, ne pas tenter de remplacer par
 * un autre caractère
 */

/**
 * Convention : stocker toutes les données validées (filtrées) dans un tableau $clean=array(). Ce tableau est initialisé à vide
 * 
 */

//Exemple : voir le fichier process.php pour la validation/filtre

?>
<form action="process.php" method="POST">
    Please select a color:
    <select name="color" id="">
        <option value="red">Red</option>
        <option value="green">Green</option>
        <option value="blue">Blue</option>
    </select>
    <input type="submit">
</form>