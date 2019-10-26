create or replace procedure supp_art (numero in char) is
  begin
    delete from ligcdes where refart=numero;
    delete from articles where refart=numero;
  end;
/