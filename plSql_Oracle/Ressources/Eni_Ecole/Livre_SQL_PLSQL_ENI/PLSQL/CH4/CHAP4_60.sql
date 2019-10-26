create view cde as
select  c.nocde, etatcde, refart, qtecde
 from commandes c, ligcdes l
 where c.nocde=l.nocde;