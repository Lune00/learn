var v_nocli number
begin
  :v_nocli:=gestion_clients.cre_cli 
     ('César','Vieux Port',13000,'Marseille');
end;
/
print v_nocli

select nocli, ltrim(nomcli) nomcli, ville
  from clients order by nocli;

begin
  gestion_clients.supp_cli(152);
end;
/

select nocli, ltrim(nomcli) nomcli, ville
  from clients order by nocli;
