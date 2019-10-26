-- Faire un TOP sur un SELECT GROUP BY en ORACLE
--SELECT * FROM
--(SELECT membres.nom,COUNT(*)  AS "Nombre d''emprunts"  FROM membres
--    membres INNER JOIN emprunts ON membres.numero=emprunts.membre
--    GROUP BY membres.nom ) WHERE ROWNUM <= 3;    


-- TOP 3 des plus gros emprunteurs sur les 8 derniers mois
--Si on mettait ça dans une fonction qui renvoie une table?
SELECT * FROM
(SELECT membres.nom,COUNT(*)  AS "Nombre d''emprunts"  FROM membres
    INNER JOIN emprunts ON membres.numero=emprunts.membre
    WHERE MONTHS_BETWEEN(sysdate,emprunts.creele)<=8
    GROUP BY membres.nom
    ) WHERE ROWNUM <= 3;       
    

    
DECLARE

CURSOR c_select_top_3 IS SELECT * FROM
(SELECT membres.nom,COUNT(*)  AS nbEmprunts  FROM membres
    INNER JOIN emprunts ON membres.numero=emprunts.membre
    WHERE MONTHS_BETWEEN(sysdate,emprunts.creele)<=8
    GROUP BY membres.nom ORDER BY membres.nom ASC
    ) WHERE ROWNUM <= 3;  
    
CURSOR c_select_low_3 IS SELECT * FROM
(SELECT membres.nom,COUNT(*)  AS nbEmprunts  FROM membres
    INNER JOIN emprunts ON membres.numero=emprunts.membre
    WHERE MONTHS_BETWEEN(sysdate,emprunts.creele)<=8
    GROUP BY membres.nom ORDER BY membres.nom DESC
    ) WHERE ROWNUM <= 3;   
    
BEGIN

DBMS_OUTPUT.PUT_LINE ('Liste des plus gros emprunteurs sur les 8 derniers mois:');
FOR i IN c_select_top_3 LOOP
DBMS_OUTPUT.PUT_LINE (i.nom||' '||i.nbEmprunts);
END LOOP;

DBMS_OUTPUT.PUT_LINE ('Liste des plus faibles emprunteurs sur les 8 derniers mois:');
FOR i IN c_select_low_3 LOOP
DBMS_OUTPUT.PUT_LINE (i.nom||' '||i.nbEmprunts);
END LOOP;
   
END;
/
    
    
    
    