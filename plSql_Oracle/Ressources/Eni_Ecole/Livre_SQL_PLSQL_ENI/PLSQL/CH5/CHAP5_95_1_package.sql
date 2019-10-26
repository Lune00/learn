create or replace package body gestion_clients as
  nombre_cli integer;  --Définition d'une variable locale

  -- implémentation du curseur
  cursor c_clients return t_clirec is
    select nocli, nomcli, adrcli, code_postal, ville
    from clients
    order by nocli;
  -- Fonction de création d'un nouveau client
  function cre_cli (nom char, adr char, codpost number, ville char)
    return number is
      nouv_nocli number;
    begin
      select s_nocli.nextval into nouv_nocli from dual;
      insert into clients
        values( nouv_nocli,nom, adr, codpost, ville);
      nombre_cli:=nombre_cli+1;
      return nouv_nocli;
    end;

  --Procédure de suppression d'un client
  procedure supp_cli (noclient number) is
    begin
      delete from clients where nocli=noclient;
    end;
end gestion_clients;
/