CREATE OR REPLACE PACKAGE BODY pkg_cde AS
   FUNCTION montant (nocde NUMBER) RETURN NUMBER
      AS LANGUAGE JAVA
      NAME 'Commandes.montant(int) return float';
   PROCEDURE livrer (nocde NUMBER) AS LANGUAGE JAVA
      NAME 'Commandes.livrer(int)';
   PROCEDURE solder (nocde NUMBER) AS LANGUAGE JAVA
      NAME 'Commandes.solder(int)';
END pkg_cde;
/