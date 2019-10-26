select  nocde, commandes.nocli, nomcli
from clients, commandes
where clients.nocli=commandes.nocli;