-- mise en place du répertoire
create or replace directory "xml_dir" as 'C:\xml';

-- chargement des données
declare

  dest_clob CLOB;
  fic_in BFILE;
  taille number;
  depart_destination integer:=1;
  depart_origine integer:=1;
  jeu_caractere number:=0;
  contexte_langue number:=0;
  avertissement number:=0;

  vid number;
begin
  fic_in:= bfilename('xml_dir','donees.xml');

  -- ouvrir le fichier
  dbms_lob.fileopen(fic_in, dbms_lob.file_readonly);

  if (dbms_lob.fileexists(fic_in)=1) then

    -- taille du fichier
    taille:=dbms_lob.getlength(fic_in);

    -- lire les données et mémoriser dans une variable
    contexte_langue:=1;
    dbms_lob.createtemporary(dest_clob, true);
    dbms_lob.loadclobfromfile(dest_clob,
           fic_in,
           taille,
           depart_destination,
           depart_origine,
           jeu_caractere,
           contexte_langue,
           avertissement);

    -- fermer le fichier
    dbms_lob.fileclose(fic_in);

    -- appeler la procédure d'ajout des données
    ajouter(dest_clob, 'CLIENTS');
    -- valider les transformations
    commit;

  end if;

end;
/
