select nocli, nomcli, case to_number(substr(code_postal,1,2))
  	when 44 then 'Loire Atlantique'
	when 75 then 'Paris'
	else 'Autre' END as departement
from clients;
