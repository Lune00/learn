<?php

namespace Modele;

use \PDO;

class ModeleDeDonnees {

    private $cnx;

    private function getConnexion() : PDO {
        if (!$this->cnx) {
            $chaineCnx = 'mysql:host=localhost;dbname=restaurant';
            $this->cnx = new PDO($chaineCnx, 'root', '', [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8", PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
        }
        return $this->cnx;
    }

    protected function executerRequete(string $sql, array $parametres = null) : \PDOStatement {
        if ($parametres == null) {
            // requete sans paramètre
            $resultats = $this->getConnexion()->query($sql);
        } else {
            // requete avec paramètres
            $resultats = $this->getConnexion()->prepare($sql);
            $resultats->execute($parametres);
        }
        return $resultats;
    }

}
