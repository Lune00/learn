drop table infos_table
/
create table infos_table(
  utilisateur varchar2(30),
  nom_table varchar2(30),
  creation date
)
/
create or replace trigger srv_table
  after ddl
  on database
begin
  if (ora_dict_obj_type='TABLE') then
    if (ora_sysevent='CREATE') then
      insert into infos_table(utilisateur,nom_table,creation)
      values (ora_login_user, ora_dict_obj_name, sysdate);
   end if;
  end if;
end;
/