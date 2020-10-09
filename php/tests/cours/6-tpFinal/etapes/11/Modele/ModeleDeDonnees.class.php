<?php
namespace Modele;
use PDO;

class ModeleDeDonnees {

    private $cnx;

    private function getConnexion() : \PDO {
        if (!$this->cnx) {
            $chaineCnx = 'mysql:host=localhost;dbname=restaurant';
            $this->cnx = new \PDO($chaineCnx, 'root', '', [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]);
            $this->cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return $this->cnx;
    }

    protected function executerRequete(string $sql, array $parametres = array()) : \PDOStatement {
        $req = $this->getConnexion()->prepare($sql);
        foreach ($parametres as $nom => $valeur) {
            $req->bindValue($nom, $valeur);
        }
        $req->execute();
        return $req;
    }

}
