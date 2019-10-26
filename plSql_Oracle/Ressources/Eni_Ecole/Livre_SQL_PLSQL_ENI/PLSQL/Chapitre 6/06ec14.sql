create or replace procedure ajouter(documentXML in CLOB, nomTable in varchar2) is
  contexteAjout DBMS_XMLSave.ctxType;
  nbreLignes number;
begin
  -- créer le contexte d'insertion
  contexteAjout:=DBMS_XMLSave.newContext(nomTable);

  -- ajouter les lignes
  nbreLignes:=DBMS_XMLSave.insertXML(contexteAjout, documentXML);

  -- fermer le contexte
  DBMS_XMLSave.closeContext(contexteAjout);
end;
/