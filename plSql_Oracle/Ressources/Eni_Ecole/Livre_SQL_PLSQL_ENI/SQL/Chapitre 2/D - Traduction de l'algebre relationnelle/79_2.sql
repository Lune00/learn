insert into tcli
  select cli.nocli, nomcli
  from clients cli, commandes cde
  where cli.nocli=cde.nocli;
