CREATE OR REPLACE FUNCTION mesureActivite(vmois in number) 
RETURN number IS
  CURSOR cActivite(vm in number) IS 
    SELECT membre, count(*) 
      FROM emprunts INNER JOIN details
      ON details.emprunt=emprunts.numero
      WHERE months_between(sysdate, creele)<vm
      GROUP BY membre
      ORDER BY 2 DESC FETCH FIRST 1 ROWS ONLY ;
    vmembre cActivite%rowtype;
BEGIN
  OPEN cActivite(vmois);
  FETCH cActivite INTO vmembre;
  CLOSE cActivite;
  RETURN vmembre.membre;
END;
/
