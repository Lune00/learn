create or replace view clinantes
  as select nocli, nomcli, adrcli
  from clients
  where upper(ville)='NANTES';