DECLARE
  nosAMis Noms:=Noms();
BEGIN
  nosAmis:=pkg_test.mesAmis 
	MULTISET INTERSECT
	pkg_test.sesAMis;
  pkg_test.affiche(nosAmis);
END;
/
