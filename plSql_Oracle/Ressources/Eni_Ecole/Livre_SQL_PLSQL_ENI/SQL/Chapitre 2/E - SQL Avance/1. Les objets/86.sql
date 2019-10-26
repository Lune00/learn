select nomcli, montant
from clients cli, (select nocde, sum(qtecde*prix) as montant
     from ligcdes l, articles a
     where l.refart=a.refart
     group by nocde) lcde,
     commandes cde
where cli.nocli=cde.nocli
  and lcde.nocde=cde.nocde;
