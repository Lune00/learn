create or replace procedure supp_table(nom_table in varchar2) as
  begin
    execute immediate 'DROP TABLE '||nom_table;
  end;
/