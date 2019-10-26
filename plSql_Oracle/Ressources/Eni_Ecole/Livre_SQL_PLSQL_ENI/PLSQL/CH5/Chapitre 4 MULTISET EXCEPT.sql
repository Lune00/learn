DECLARE
  lesAMis Noms:=Noms();
BEGIN
  lesAmis:=pkg_test.mesAmis 
	MULTISET EXCEPT
	pkg_test.sesAMis;
  pkg_test.affiche(lesAmis);
END;
/
