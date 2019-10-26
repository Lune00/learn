variable no_client number
variable nom_client char(20)

begin
  for vcli in (select nocli, nomcli from clients) loop
    :no_client:=vcli.nocli;
    :nom_client:=vcli.nomcli;
  end loop;
end;
/
rem Dernier client lu dans la boucle
print no_client
print nom_client
