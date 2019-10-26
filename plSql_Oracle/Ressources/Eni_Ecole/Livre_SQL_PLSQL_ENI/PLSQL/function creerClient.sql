create function creerClient(vnom char, vadresse char, vcodep number, vville char) 
  return number is
  vnumero number(6);
begin
    insert into clients(nocli, nomcli, adrcli, code_postal, ville)
	values (seq_cli.nextval, vnom, vadresse, vcodep, vville)
	returning nocli into vnumero;
    return vnumero;
end;
/