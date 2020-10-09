<?php
session_start();
setcookie('pseudo','schumi',time() + 60 * 2, null, null, false, true);
?>


<h1>Titre</h1>

<?php if(!empty($_POST['pseudo'])){ ?>
<p>Bonsoir  <?php echo htmlspecialchars($_POST['pseudo']) ?> !</p>
<?php } else{ ?>
<p>Vous n'avez pas renseigné de pseudo <?php echo $_SESSION['nom']?> !!</p>
<?php } ?>


<p>Vous vivez en <?php echo htmlspecialchars($_POST['country']) ?> !</p>

<?php define('PASSWORD', 'kangourou') ?>

<?php if(isset($_FILES['myFile']) AND $_FILES['myFile']['error'] == 0) : ?>
    move_uploaded_file($_FILES['myFile']['tmp_name'], 'upload/' . basename($_FILES['myFile']['name']));
    echo "Fichier uploadé avec succès !";
<?php endif; ?>

<?php if(isset($_POST['password']) and $_POST['password'] == constant('PASSWORD') ) : ?>
   <h2>Acces aux mots de passe </h2>
   <p>Voici les mots de passe des lancements de missile</p>
<?php endif; ?>


<p>Hey, ton pseudo en vrai ce serait pas <?php echo $_COOKIE['pseudo']?> par hasard???</p>

<pre>
<?php 
// print_r($_SERVER);
print_r($_COOKIE);
print_r($_SESSION);
?>
</pre>


<script>
    console.log(document.cookie)
</script>