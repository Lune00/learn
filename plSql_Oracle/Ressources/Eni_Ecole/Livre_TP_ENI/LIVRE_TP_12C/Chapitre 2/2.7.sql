
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(7,2,2038704015,1,sysdate-136);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(8,2,2038704015,1,sysdate-127);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(11,2,2038704015,1,sysdate-95);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(15,2,2038704015,1,sysdate-54);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(16,3,2038704015,1,sysdate-43);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(17,2,2038704015,1,sysdate-36);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(18,2,2038704015,1,sysdate-24);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(19,2,2038704015,1,sysdate-13);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(20,3,2038704015,1,sysdate-3);
UPDATE exemplaires SET etat='NE' WHERE isbn=2038704015 and numero=1;
commit;

Create table tempoExemplaires as select isbn, exemplaire, count(*) as locations 
from details group by isbn, exemplaire;

Merge into exemplaires e 
using (select isbn, exemplaire, locations from tempoexemplaires) t
on (t.isbn=e.isbn and t.exemplaire=e.numero)
when matched then
  update set etat='BO' where t.locations between 11 and 25
 delete where t.locations>60;

Drop table tempoExemplaires;