-- Définition d'une procédure qui retourne 

-- un résultat implicite.

CREATE OR REPLACE PROCEDURE liste_articles
 IS
 
 cur_articles SYS_REFCURSOR;

BEGIN
 
 OPEN cur_articles FOR
  SELECT refart,designation 
  FROM articles ;

  dbms_sql.return_result(cur_articles);

END liste_articles;

/


-- Appel de la procédure.

EXECUTE liste_articles;
