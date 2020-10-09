<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        $fichier = fopen('cp.csv', 'r');
        while($ligne = fgets($fichier)) {
            $infos = explode(';', $ligne);
            var_dump($infos);
            /*if(isset($cp[$infos[0]]))
                $cp[$infos[0]].='|'.$infos[1];
            else
                $cp[$infos[0]]=$infos[1];*/
        }
        //var_dump($cp['01000']);
        ?>
    </body>
</html>
