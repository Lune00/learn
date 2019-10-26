create directory "file_dir" as 'c:\temp';

DECLARE
--  TYPE ptr_fichier IS RECORD (id BINARY_INTEGER);
  f_out UTL_FILE.FILE_TYPE;
BEGIN
  -- ouvrir le ficchier
  f_out:=UTL_FILE.FOPEN('file_dir','test.txt','w');
  -- ecrire une ligne
  UTL_FILE.PUT(f_out,'Ceci est un exemple');
  -- positionner une fin de ligne
  UTL_FILE.NEW_LINE(f_out);
  -- ecrire une ligne complète
  UTL_FILE.PUT_LINE(f_out,'ligne2');
  -- écriture formatée de 2 lignes
  UTL_FILE.PUTF(f_out,'Bonjour\n Exemple de %s\n','la procédure PUTF');
  UTL_FILE.FFLUSH(f_out);
  -- fermer le fichier
  UTL_FILE.FCLOSE(f_out);
END;
/