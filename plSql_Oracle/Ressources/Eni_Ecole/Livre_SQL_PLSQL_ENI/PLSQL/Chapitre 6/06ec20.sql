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

  -- les variables pour la suppression
  contexteSupp DBMS_XMLSave.ctxType;
  nombreLignes  number;

begin
  fic_in:= bfilename('xml_dir','donees4.xml');

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



  -- création du contexte de suppression
  contexteSupp:=DBMS_XMLSave.newContext('CLIENTS');
  -- effacer les paramètres
  DBMS_XMLSave.clearUpdateColumnList(contexteSupp);
  -- Colonne d'identifications
  DBMS_XMLSave.setKeyColumn(contexteSupp,'NOCLI');
  -- effectuer la suppression
  nombreLignes:=DBMS_XMLSave.deleteXML(contexteSupp,documentXML);
  --fermer le contexte
  DBMS_XMLSave.closeContext(contexteSupp);
  -- valider les transformations
  commit;

end;
/
