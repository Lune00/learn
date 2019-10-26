create table parametres(code number(6),valeur varchar2(40));

insert into parametres select rownum,decode(rownum,1,'ENI','XXX') from all_objects where rownum <= 10;

commit;



create or replace function valeur_parametre(n in number)
 
 return varchar2
 
 result_cache relies_on (parametres)
 is
 
 resultat varchar2(40);

  fin timestamp;

begin
 
 -- code qui simule un temps d'exécution long
 
  fin := systimestamp + 2/24/60/60;
 
 while systimestamp < fin
  loop
 
  null;
 
end loop;
 
 -- sélectionner et retourner la valeur demandée
 
 select valeur into resultat from parametres where code = n;

  return resultat;

end;

/



set timing on

select valeur_parametre(1) from dual;

select valeur_parametre(1) from dual;

insert into parametres(code,valeur) 
values(123,'un deux trois');

commit;

select valeur_parametre(1) from dual;

select valeur_parametre(1) from dual;

set timing off



drop table parametres purge;

drop function valeur_parametre;
