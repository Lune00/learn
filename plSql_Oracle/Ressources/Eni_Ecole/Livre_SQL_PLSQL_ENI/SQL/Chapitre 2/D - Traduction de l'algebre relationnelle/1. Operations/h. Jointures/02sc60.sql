select nocde, commandes.nocli, nomcli
  from clients inner join commandes on 
       clients.nocli=commandes.nocli;