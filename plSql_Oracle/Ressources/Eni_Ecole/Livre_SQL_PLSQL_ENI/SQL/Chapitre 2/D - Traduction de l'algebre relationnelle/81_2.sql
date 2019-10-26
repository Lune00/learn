select decode(grouping(nomcli),1,'Tous les clients', nomcli) as nom, 
       decode(grouping(c.nocde),1,'Toutes les commandes',nocde) as nocde,        sum(prix*qtecde) as total
from clients cli, commandes c, ligcdes l, articles a
where c.nocli=cli.nocli and c.nocde=l.nocde
  and l.refart=a.refart
group by cube (nomcli, c.nocde);
