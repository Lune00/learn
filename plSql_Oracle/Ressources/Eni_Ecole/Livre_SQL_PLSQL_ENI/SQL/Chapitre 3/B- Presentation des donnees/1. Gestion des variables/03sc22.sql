accept numero number prompt "Num�ro du client ?"
accept nom prompt "Nom client ?"
def tb=clients
select * from &tb
 where nocli > &numero
   and nom='&nom';