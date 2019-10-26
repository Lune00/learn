create or replace procedure supp_table(nom_table in varchar2) as
  begin
    execute immediate 'DROP TABLE :t' using nom_table;
  end;