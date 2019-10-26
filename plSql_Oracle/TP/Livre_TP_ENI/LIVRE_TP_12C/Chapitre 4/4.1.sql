select details.isbn, details.exemplaire, exemplaires.etat, count(*) as "Nombre d'emprunts"
from details inNEr join exemplaires  ON details.isbn= exemplaires.isbn and details.exemplaire= exemplaires.numero
group by details.isbn, details.exemplaire, exemplaires.etat;

--première solution :
DECLARE
  nb int;
  cursor cLesExemplaires IS select d.isbn,d.exemplaire,etat,count(*) as nbre
          from details d inner join exemplaires ex on d.isbn = ex.isbn and d.numero = ex.numero
          group by d.isbn,d.exemplaire,etat;
  Vetat exemplaires.etat%TYPE;          
BEGIN
  for Vexemplaire IN cLesExemplaires LOOP
    IF (Vexemplaire.nbre<=10) 
      THEN vetat:='NE';
      ELSE IF (Vexemplaire.nbre<=25) 
             THEN vetat:='BO';
             ELSE IF (Vexemplaire.nbre<=40) 
                    THEN vetat:='MO';
                    ELSE vetat:='MA';
                  END IF;
           END IF;
    END IF;
    UPDATE EXEMPLAIRES set etat = Vetat WHERE isbn = Vexemplaire.isbn and numero = Vexemplaire.exemplaire;
  END LOOP;
END;

--deuxième solution
DECLARE
  CURSOR cLesExemplaires IS 
    SELECT * FROM exemplaires FOR UPDATE OF etat;
  Vetat exemplaires.etat%type;
  Vnbre number(3);
BEGIN
  FOR vexemplaire IN cLesExemplaires LOOP
    SELECT count(*) INTO vnbre FROM details 
         WHERE details.isbn=vexemplaire.isbn  AND details.exemplaire=vexemplaire.numero;
    CASE  
      WHEN vnbre <11  THEN vetat := 'NE';
      WHEN vnbre <26  THEN vetat := 'BO';
      WHEN vnbre <41  THEN vetat := 'MO';
      ELSE vetat := 'MA';
    END CASE;    
    UPDATE exemplaires SET etat=vetat WHERE CURRENT OF cLesExemplaires;    
  END LOOP;
END;
/

