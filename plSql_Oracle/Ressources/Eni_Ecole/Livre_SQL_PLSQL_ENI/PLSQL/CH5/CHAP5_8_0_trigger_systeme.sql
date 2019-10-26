create or replace trigger svr_erreur
  after SERVERERROR on schema
begin
  insert into les_erreurs (utilisateur, temps, num_erreur)
  values (ora_login_user,sysdate,ora_server_error(1));
end;
/
