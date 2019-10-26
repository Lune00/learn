declare 
  verrou_mortel exception;
  pragma exception_init(verrou_mortel, -60);
begin
  -- traitement
  update clients set nomcli=upper(nomcli);
exception
  -- gestion de l'exception
  when verrou_mortel then
    rollback;
end;
/