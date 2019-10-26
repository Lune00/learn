set serveroutput on 
-- Mise au format XML du r�sultat d'une requ�te
declare
  contexteRqt DBMS_XMLQuery.ctxType;
  resultat    CLOB;
begin
  -- mise en place du constexte de requ�te
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
      -- obtenir le r�sultat
      resultat:= DBMS_XMLQuery.getXML(contexteRqt);
      -- afficher le r�sultat
      afficheCLOB(resultat);  
    end loop;
  exception
    when others then
      null; --sortir du bloc en cas d'erreur
  end;


  -- fermer le contexte de requ�te
  DBMS_XMLQuery.closeContext(contexteRqt);  
end;
/