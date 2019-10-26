create or replace procedure supp_clients(vnocli number) as
  begin
    execute immediate 'DELETE FROM clients WHERE nocli='||
      to_char(vnocli);
  end;