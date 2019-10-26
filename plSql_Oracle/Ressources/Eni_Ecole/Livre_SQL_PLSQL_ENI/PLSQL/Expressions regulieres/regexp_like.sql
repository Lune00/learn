select nocli, nomcli
from clients
where regexp_like(nomcli,'^B[[:lower:]]');