select nocli,adrcli
from clients exceptions
where clients.rowid=exceptions.row_id
and exceptions.table_name='CLIENTS'
and exceptions.constraint='CLI_ADRCLI_UN';