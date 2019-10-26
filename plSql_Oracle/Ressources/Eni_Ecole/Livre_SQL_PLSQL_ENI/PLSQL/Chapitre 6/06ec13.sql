set serveroutput on 
-- Mise au format XML du résultat d'une requête
declare
  contexteRqt DBMS_XMLQuery.ctxType;
  resultat    CLOB;
begin
  -- mise en place du constexte de requête
  contexteRqt:=DBMS_XMLQuery.newContext('select * from clients where nocli=:numero');

  -- fixer la valeur du paramètre
  DBMS_XMLQuery.setBindValue(contexteRqt,'numero',15);

  -- obtenir le résultat
  resultat:= DBMS_XMLQuery.getXML(contexteRqt);
  -- afficher le résultat
  afficheCLOB(resultat);  

  -- fixer un autre valeur pour la paramètre
  DBMS_XMLQuery.setBindValue(contexteRqt,'numero',20);

  -- obtenir le résultat
  resultat:= DBMS_XMLQuery.getXML(contexteRqt);
  -- afficher le résultat
  afficheCLOB(resultat);  
  

  -- fermer le contexte de requête
  DBMS_XMLQuery.closeContext(contexteRqt);  
end;
/