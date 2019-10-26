DECLARE
  total number;
BEGIN
  ------------> Ajout d'infos
  INSERT INTO 
    TABLE(Select stock from depot where nom='Paris')
    VALUES('VELO',2000);
  ------------> Recherche d'infos
  SELECT SUM(montant) INTO total
    FROM TABLE( SELECT Lescommandes 
                                FROM Facture
                                WHERE nofact=1);
END;
/