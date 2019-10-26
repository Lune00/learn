select nomcli, c.nocde, sum(prix*qtecde) as total
from clients cli, commandes c, ligcdes l, articles a
where c.nocli=cli.nocli and c.nocde=l.nocde
  and l.refart=a.refart
group by rollup (nomcli, c.nocde);