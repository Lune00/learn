<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>phpinfo()</title>
        <link href="../../style/style.css" rel="stylesheet">
    </head>
    <body>
        <h1>La fonction <a href="http://php.net/manual/fr/function.phpinfo.php"><code>phpinfo()</code></a></h1>
        <?php
        require '../../afficheCode.php';
        afficheCode(['phpinfo.php'], false, 'phpinfo.php');
        ?>
    </body>
</html>