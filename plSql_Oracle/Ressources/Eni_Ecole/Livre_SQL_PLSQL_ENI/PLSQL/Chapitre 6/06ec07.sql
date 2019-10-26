set serveroutput on 
-- Mise au format XML du résultat d'une requête
declare
  contexteRqt DBMS_XMLQuery.ctxType;
  resultat    CLOB;
begin
  -- mise en place du constexte de requête
  contexteRqt:=DBMS_XMLQuery.newContext('select * from clients');

  -- obtenir le résultat
  resultat:= DBMS_XMLQuery.getXML(contexteRqt);

  -- afficher le résultat
  afficheCLOB(resultat);

  -- fermer le contexte de requête
  DBMS_XMLQuery.closeContext(contexteRqt);  
end;
/