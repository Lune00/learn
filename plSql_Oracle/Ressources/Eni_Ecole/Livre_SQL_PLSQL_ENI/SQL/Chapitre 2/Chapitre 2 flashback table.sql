select count(*) from clients;
flashback table clients
to timestamp
to_timestamp('28/07/2004 19:06:00','DD/MM/YYYY HH24:MI:SS');
select count(*) from clients;

