CREATE OR REPLACE PACKAGE pkg_cde AS
   FUNCTION montant (nocde NUMBER) RETURN NUMBER;
   PROCEDURE livrer (nocde NUMBER);
   PROCEDURE solder (nocde NUMBER);
END pkg_cde;
/