DECLARE
  nouvelles_cdes TabCommandes:=TabCommandes(
    LaCommande(3,600),
    LaCommande(10,800),
    LaCommande(11,1680));
BEGIN
  ------------------------------- Ajout 
INSERT INTO Facture VALUES(
  1,1,  TabCommandes(
    LaCommande(2,500),
    LaCommande(12,600),
    LaCommande(13,1500)));
INSERT INTO Facture VALUES(
    2,2,  TabCommandes(
    LaCommande(3,550),
    LaCommande(10,135)));
  ------------------------------> Modification
  UPDATE Facture SET Lescommandes=nouvelles_cdes
    where nofact=2;
END;
/