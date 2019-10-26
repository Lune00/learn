variable no_client number
variable nom_client char(20)
declare
  cursor ccli is select nocli, nomcli from clients;
begin
  for vcli in ccli loop
    :no_client:=vcli.nocli;
    :nom_client:=vcli.nomcli;
  end loop;
end;
/
rem Dernier client lu dans la boucle
print no_client
print nom_client
