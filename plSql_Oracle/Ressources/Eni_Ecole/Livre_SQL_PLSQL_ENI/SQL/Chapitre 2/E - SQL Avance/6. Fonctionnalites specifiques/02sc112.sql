select nocli, nomcli, case 
  	when to_number(substr(code_postal,1,2)) in (44,49,72,85,53)
		 then 'Pays de la Loire'
	else 'Autre' END as departement
from clients;
