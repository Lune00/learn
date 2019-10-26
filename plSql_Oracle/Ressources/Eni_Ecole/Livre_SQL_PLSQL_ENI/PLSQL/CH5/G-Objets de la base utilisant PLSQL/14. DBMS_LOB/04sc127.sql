-- creation de la table de destinations
create table mesphotos (
  id number,
  img blob);
create sequence seq_id_photos;

-- mise en place du répertoire
create or replace directory "O9i_dir" as 'C:\O9i';

-- chargement des données
declare
  fic_in BFILE;
  taille number;
  dest_blob BLOB;
  vid number;
begin
  fic_in:= bfilename('O9i_dir','BPR.gif');

  -- ouvrir le fichier
  dbms_lob.fileopen(fic_in, dbms_lob.file_readonly);

  if (dbms_lob.fileexists(fic_in)=1) then

    -- taille du fichier
    taille:=dbms_lob.getlength(fic_in);
    insert into mesphotos values (seq_id_photos.nextval, empty_blob())
      return id,img into vid,dest_blob;

    -- lire les données et mémoriser dans une variable
    dbms_lob.loadfromfile(dest_blob,fic_in, taille);

    -- insérer dans la table
    update mesphotos set img=dest_blob where id=vid;
    commit;

    -- fermer le fichier
    dbms_lob.fileclose(fic_in);

  end if;

exception

  when dbms_lob.invalid_argval then
    raise_application_error(-20001,'Mauvais argument');

  when dbms_lob.access_error then
    raise_application_error(-20002,'Dépassement capacité');

  when dbms_lob.noexist_directory then
    raise_application_error(-20003,'Répertoire inexistant');

  when dbms_lob.nopriv_directory then
    raise_application_error(-20004,'Privilèges insuffisant sur le répertoire');

  when dbms_lob.unopened_file then
    raise_application_error(-20007,'Fichier non ouvert');

  when others then
    dbms_lob.fileclose(fic_in);
    raise_application_error(-20008,'ERR'||SQLCODE||' '||SQLERRM);

end;
/


