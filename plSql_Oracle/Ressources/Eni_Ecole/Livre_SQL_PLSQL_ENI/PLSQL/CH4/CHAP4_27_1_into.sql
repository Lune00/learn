declare
  vref char(10);
  vprix articles.prix%type;
  cli clients%rowtype;
begin
  select refart, prix 
    into vref, vprix
    from articles
   where lower(rtrim(designation)) like 'cadeau%';

  select * into cli
    from clients
   where nocli=35;
end;
/