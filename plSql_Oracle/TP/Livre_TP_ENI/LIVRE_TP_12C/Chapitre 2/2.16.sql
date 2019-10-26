create or replace view ouvragesEmpruntes as
select emprunts.membre, count(*) as NombreEmprunts
from emprunts inner join details on 
 emprunts.numero=details.emprunt 
 where details.rendule is null
group by emprunts.membre;