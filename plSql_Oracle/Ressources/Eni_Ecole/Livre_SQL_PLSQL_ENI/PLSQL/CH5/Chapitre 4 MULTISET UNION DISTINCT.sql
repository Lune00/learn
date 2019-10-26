DECLARE
  nosAMis Noms:=Noms();
BEGIN
  nosAmis:=pkg_test.mesAmis 
	MULTISET UNION DISTINCT
	pkg_test.sesAMis;
  pkg_test.affiche(nosAmis);
END;
/
