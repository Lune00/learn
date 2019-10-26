set echo on

set timing on


-- Création d'une table comportant un grand nombre de lignes.

drop table employes purge;

create table employes
 cache 
nologging 
as
 select
  rownum id,
  object_name nom,

  lpad('x',500,'x') data,
  add_months(trunc(sysdate),- (20+mod(rownum,40))*12) date_naissance
 
from
  all_objects cross join (select 1 from dual connect by level <= 5);



-- Création d'une fonction.

create or replace function maj(p varchar2)
 
 return varchar2

is

begin
  
return upper(p);

end;

/


-- Appel de cette fonction dans un ordre SQL.
select count(distinct maj(nom)) from employes;


-- Recréation de la fonction avec le pragma UDF.

create or replace function maj(p varchar2)

  return varchar2

is
  pragma udf;

begin
 
 return upper(p);

end;

/


-- Appel de la fonction modifiée dans un ordre SQL.

select count(distinct maj(nom)) from employes;


-- Appel d'une fonction définie dans la clause WITH.

with

function maj(p varchar2)

  return varchar2 is

 begin

  return upper(p);

end;

select count(distinct maj(nom)) from employes

/
