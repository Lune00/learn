<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>TP 1 : classes</title>
        <link href="../../style/style.css" rel="stylesheet">
        <link href="../../style/correction.css" rel="stylesheet">
    </head>
    <body>
        <h1>TP 1 : classes</h1>
        <h2 class="dif1">Question 1</h2>
        <section class="enonce">Écrire une classe représentant une ville. Elle doit avoir les méthodes <code>setNom()</code> et <code>setDépartement()</code> et une méthode affichant &laquo;&nbsp;la ville X est dans le département Y&nbsp;&raquo;. Cette classe n'a pas de constructeur.<br>Créer des instances de Ville, affecter leurs propriétés et utiliser la méthode d'affichage.</section>
        <?php
        require_once '../../afficheCode.php';
        afficheCode(['../classes/Ville.class.php', 'tp1q1.php'], true, 'tp1q1.php', true, 'Les attributs sont déclarés avec la visibilité <code>private</code> pour respecter le principe de l\'encapsulation. Pour accéder aux attributs, il faut utiliser <code>$this-&gt;</code>, il n\'y a pas d\'autres moyens d\'accéder aux attributs.<br>La création d\'une instance est réalisée grâce au mot clé <code>new</code> qui est utilisé. Cette classe ne possède pas de constructeur mais cela ne pose aucun problème : il n\'est pas obligatoire et ne sera donc pas appelé lors de la création de l\'instance.<br>L\'opérateur <code>-&gt;</code> permet de faire appel aux méthodes d\'instance.');
        ?>
        <h2 class="dif1">Question 2</h2>
        <section class="enonce">Créer une autre classe représentant une ville mais sans les accesseurs et avec un constructeur à la place.<br>Réaliser les mêmes opérations de création d'instances et d'affichage.</section>
        <?php
        afficheCode(['../classes/VilleCtr.class.php', 'tp1q2.php'], true, 'tp1q2.php', true, 'Le constructeur est une méthode magique nommé <code>__construct()</code>. Cette méthode magique est appelée automatiquement, si elle existe, lors de la création d\'une instance de cette classe. Ceci explique pourquoi il n\'est pas obligatoire.');
        ?>
        <h2 class="dif1">Question 3</h2>
        <section class="enonce">Créer une classe nommée <code>VilleAvecRegion</code> héritant de la classe <code>Ville</code> affichant &laquo;&nbsp;la ville X est dans le département Y de la région Z&nbsp;&raquo;.</section>
        <?php
        afficheCode(['../classes/VilleAvecRegion.class.php', 'tp1q3.php'], true, 'tp1q3.php', true, 'L\'instruction <code>require_once \'Ville.class.php\';</code> permet d\'inclure le fichier contenant la définition de la classe Ville et donc de définir cette classe. Cela est nécessaire puisque la nouvelle classe VilleAvecRegion en hérite.<br>Le choix a été fait d\'hériter de la classe Ville ne possédant pas de constructeur mais il aurait également été possible d\'hériter de celle possédant un constructeur.<br>La méthode <code>__toString()</code> substitue celle qui existait dans la classe Ville. Cette méthode fait appel à la méthode de la classe parent en utilisant l\'instruction <code>parent::__toString()</code>.');
        ?>
        <h2 class="dif1">Question 4</h2>
        <section class="enonce">Modifier la classe Ville avec constructeur pour que l'on puisse connaître la ville ayant le nom le plus long.</section>
        <?php
        afficheCode(['../classes/VilleCtr2.class.php', '../classes/VilleCtrAvecRegion.class.php', 'tp1q4.php'], true, 'tp1q4.php', true, 'Un attribut de classe a été ajouté grâce à l\'instruction <code>protected static $nomLePlusLong;</code>. Cet attribut a été déclaré avec la visibilité <code>protected</code> afin que si une classe en hérite que cet attribut soit accessible de celle-ci. Ceci est illustré avec la classe VilleCtrAvecRegion.<br>La méthode de classe permet quant à elle de consulter la valeur contenue dans cet attribut de classe.');
        ?>
        <h2 class="dif2">Question 5</h2>
        <section class="enonce">Créer une classe nommée <code>Form</code> représentant un formulaire HTML. Le constructeur doit créer le code d'en-tête du formulaire en utilisant les éléments <code>&lt;form&gt;</code> et <code>&lt;fieldset&gt;</code>.<br>Une méthode <code>setText()</code> doit permettre d'ajouter une zone de texte.<br>Une méthode <code>setSubmit()</code> doit permettre d'ajouter un bouton d'envoi.<br>Les paramètres de ces méthodes doivent correspondre aux attributs des éléments HTML correspondants.<br>La méthode <code>getForm()</code> doit retourner tout le code HTML de création du formulaire.<br>Créer des objets <code>Form</code> et y ajouter deux zones de texte et un bouton d'envoi. Tester l'affichage obtenu.</section>
        <?php
        echo '<h3>Version simple</h3>';
        afficheCode(['../classes/FormSimple.class.php', 'tp1q5Simple.php'], true, 'tp1q5Simple.php', true, 'L\'attribut <code>formulaire</code> contient le code HTML nécessaire à l\'affichage du formulaire. Son contenu va être complété au fur et à mesure des appels aux méthodes de la classe.');
        echo '<h3>Version avancée</h3>';
        afficheCode(['../classes/Form.class.php', 'tp1q5.php'], true, 'tp1q5.php', true, 'Cette seconde proposition permet de gérer plus finement les attributs de la balise input : il est possible d\'ajouter des attributs pour les balises de champs de saisie. Par exemple, une valeur par défaut et une infobulle ont été ajoutées à cette balise input.');
        ?>

        <h2 class="dif2">Question 6</h2>
        <section class="enonce">Créer une sous-classe nommée <code>Form2</code> en dérivant la classe <code>Form</code> de la question précédente. Cette nouvelle classe doit permettre de créer des formulaires ayant en plus des boutons radio et des cases à cocher. Elle doit donc avoir les méthodes supplémentaires qui correspondent à ces créations.<br>Créer des objets et tester le résultat.</section>
        <?php
        echo '<h3>Version simple</h3>';
        afficheCode(['../classes/FormSimple2.class.php', 'tp1q6Simple.php'], true, 'tp1q6Simple.php', true, 'La méthode <code>setCheckBox()</code> est très similaire à celle pour les champs de texte. La principale différence est que le label est positionné après la balise input.<br>Pour la méthode <code>setRadioButton()</code>, il faut un attribut de plus permettant de savoir à quel groupe le bouton radio doit être associé pour faire en sorte qu\'il ne puisse y avoir qu\'un seul bouton radio de ce groupe qui puisse être sélectionné simultanément.');
        echo '<h3>Version avancée</h3>';
        afficheCode(['../classes/Form2.class.php', 'tp1q6.php'], true, 'tp1q6.php', true, 'Cette version offre les mêmes possibilités qu\'avec la version simple mais elle reprend également les possibilités offertes par la classe Form dont elle hérite. Elle permet également d\'ajouter n\'importe quel autre type d\'input comme par exemple des champs cachés, des champs de mot de passe ou des champs de sélection de fichier par exemple.');
        ?>

        <h2 class="dif2">Question 7</h2>
        <section class="enonce">Créer une classe abstraite représentant une personne. Elle déclare les propriétés <code>nom</code> et <code>prenom</code> et un constructeur.<br>Créer une classe <code>Client</code> dérivée de la classe <code>Personne</code> en y ajoutant la propriété <code>adresse</code>, une méthode <code>setcoord()</code> et la méthode <code>__toString()</code> qui retourne les coordonnées complètes de la personne.<br>Créer une classe <code>Electeur</code> dérivée de la même classe abstraite et y ajouter deux propriétés <code>bureau_de_vote</code> et <code>vote</code> ainsi qu'une méthode <code>avote()</code> qui enregistre que la personne a voté dans la propriété <code>vote</code>.</section>
        <?php
        afficheCode(['../classes/Personne.class.php', '../classes/Client.class.php', '../classes/Electeur.class.php', 'tp1q7.php'], true, 'tp1q7.php', true, 'La méthode magique <code>__toString()</code> est appelée automatiquement lorsque l\'instance est considérée comme une chaîne de caractères. C\'est par exemple le cas avec l\'instruction <code>echo $e1; par exemple</code>.');
        ?>
    </body>
</html>
