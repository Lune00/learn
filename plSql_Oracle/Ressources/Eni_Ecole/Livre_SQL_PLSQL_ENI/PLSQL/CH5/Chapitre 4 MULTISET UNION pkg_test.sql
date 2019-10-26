DECLARE
  nosAMis Noms:=Noms();
  resultat Noms:=Noms();
BEGIN
  nosAmis:=pkg_test.mesAmis 
	MULTISET UNION 
	pkg_test.sesAMis;
  resultat:=SET(nosAmis);
  pkg_test.affiche(resultat);
END;
/
