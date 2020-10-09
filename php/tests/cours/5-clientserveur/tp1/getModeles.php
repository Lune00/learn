<?php
$marque = filter_input(INPUT_GET, 'marque', FILTER_SANITIZE_STRING);
if ($marque) {
    try {
        require_once '../../4-accesDonnees/tp1/tp1cnx.php';
        $req = $pdo->prepare(
                'SELECT DISTINCT modele FROM modeles WHERE marque = :marque;');
        $req->bindValue(':marque', $marque);
        $req->execute();
        while ($v = $req->fetch()) {
            echo '<option>'.$v['modele'].'</option>';
        }
    } catch (PDOException $e) {
        $msg = 'ERREUR PDO dans ' . $e->getFile() . ' : ' . $e->getLine() .
                ' : ' . $e->getMessage();
        die($msg);
    }
}
