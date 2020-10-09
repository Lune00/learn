<?php
session_start();
$_SESSION['nom'] = 'Schuhmacher';
?>


<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="">
    </head>
    <body>


        <p>Bonjour <?php echo $_SESSION['nom'];?> !</p>
        <form action="bonjour.php" method="POST" enctype="multipart/form-data">


            <label for="pseudo">Votre pseudo : </label>
            <input type="text" name="pseudo" id="pseudo"/>
            <br>
            <label for="password">Mot de passe :</label>
            <input type="password" name="password" id=""/>
            <br>
            <input type="submit" value="Envoyer" id="buttonSend"/>


            <select name="country">
                <option value="france">France</option>
                <option value="usa">USA</option>
                <option value="germany">Allemagne</option>
            </select>

            <input type="file" name="myFile" id=""/>
        </form>
        
        <script >

            const button = document.getElementById('buttonSend')
            button.addEventListener("click",()=>{
                console.log('Send!', document.getElementById('pseudo').value )
            })

        </script>
    </body>
</html>


