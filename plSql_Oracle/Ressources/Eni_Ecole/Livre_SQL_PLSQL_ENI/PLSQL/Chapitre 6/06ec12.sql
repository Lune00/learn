set serveroutput on 
-- Mise au format XML du résultat d'une requête
declare
  contexteRqt DBMS_XMLQuery.ctxType;
  resultat    CLOB;
begin
  -- mise en place du constexte de requête
  contexteRqt:=DBMS_XMLQuery.newContext('select * from clients');

  --modification du nom de la balise ROW
  DBMS_XMLQuery.setRowTag(contexteRqt,'CLIENT');
  
  --modification du nom de la balise ROWSET
  DBMS_XMLQuery.setRowSetTag(contexteRqt,'CLIENTS');

  -- fixer le nombre de lignes par document XML
  DBMS_XMLQuery.setMaxRows(contexteRqt,10);
  DBMS_XMLQuery.setRaiseNoRowsException(contexteRqt, true);

  -- extraction des informations 
  begin
    loop  -- boucle infinie
      -- obtenir le résultat
      resultat:= DBMS_XMLQuery.getXML(contexteRqt);
      -- afficher le résultat
      afficheCLOB(resultat);  
    end loop;
  exception
    when others then
      null; --sortir du bloc en cas d'erreur
  end;


  -- fermer le contexte de requête
  DBMS_XMLQuery.closeContext(contexteRqt);  
end;
/