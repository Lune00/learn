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

  -- les variables pour l'ajout des données
  contexteAjout DBMS_XMLSave.ctxType;
  nombreLignes  number;

begin
  fic_in:= bfilename('xml_dir','donees2.xml');

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

  -- ajouter les données au format XML dans la table
  contexteAjout:=DBMS_XMLSave.newContext('CLIENTS');
  -- effacer les paramètres
  DBMS_XMLSave.clearUpdateColumnList(contexteAjout);
  -- les colonnes pour lesquelles il exite une valeur
  DBMS_XMLSave.setUpdateColumn(contexteAjout,'NOCLI');
  DBMS_XMLSave.setUpdateColumn(contexteAjout,'NOMCLI');
  -- effectuer les insertions
  nombreLignes:=DBMS_XMLSave.insertXML(contexteAjout,documentXML);
  --fermer le contexte
  DBMS_XMLSave.closeContext(contexteAjout);
  -- valider les transformations
  commit;

end;
/
