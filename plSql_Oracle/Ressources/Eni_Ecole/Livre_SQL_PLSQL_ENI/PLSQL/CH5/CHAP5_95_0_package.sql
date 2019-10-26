create or replace package gestion_clients as
  type t_clirec is record(
    nocli   number(4),
    nom     char(20),
    adr     char(20),
    codpost number(5),
    ville   char(30));
  cursor c_clients return t_clirec;
  function cre_cli (nom char, adr char, codpost number, ville char)
    return number;
  procedure supp_cli (noclient number);
end gestion_clients;
/