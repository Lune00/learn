declare
  -- la variables nécessaires à la lecture d'un fichier
  documentXML CLOB;
  fic_in      BFILE;
  taille      number;
  depart_destination integer:=1;
  depart_origine     integer:=1;
  jeu_caractere      number:=0;
  contexte_langue    number:=0;
  avertissement      number:=0;

  -- les variables pour la mise à jour
  contexteMAJ DBMS_XMLSave.ctxType;
  nombreLignes  number;

begin
  fic_in:= bfilename('xml_dir','donees3.xml');

  -- ouvrir le fichier
  dbms_lob.fileopen(fic_in, dbms_lob.file_readonly);

  -- taille du fichier
  taille:=dbms_lob.getlength(fic_in);

  -- lire les données et mémoriser dans une variable
  contexte_langue:=1;
  dbms_lob.createtemporary(documentXML, true);
  dbms_lob.loadclobfromfile(documentXML,
           fic_in,
           taille,
           depart_destination,
           depart_origine,
           jeu_caractere,
           contexte_langue,
           avertissement);
  -- fermer le fichier
  dbms_lob.fileclose(fic_in);



  -- création du contexte de mise à jour
  contexteMAJ:=DBMS_XMLSave.newContext('CLIENTS');
  -- effacer les paramètres
  DBMS_XMLSave.clearUpdateColumnList(contexteMAJ);
  -- Colonne d'identifications
  DBMS_XMLSave.setKeyColumn(contexteMAJ,'NOCLI');
  -- Colonnes à mettre à jour
  DBMS_XMLSave.setUpdateColumn(contexteMAJ,'CODE_POSTAL');
  DBMS_XMLSave.setUpdateColumn(contexteMAJ,'VILLE');
  -- effectuer les mises à jour
  nombreLignes:=DBMS_XMLSave.updateXML(contexteMAJ,documentXML);
  --fermer le contexte
  DBMS_XMLSave.closeContext(contexteMAJ);
  -- valider les transformations
  commit;

end;
/
