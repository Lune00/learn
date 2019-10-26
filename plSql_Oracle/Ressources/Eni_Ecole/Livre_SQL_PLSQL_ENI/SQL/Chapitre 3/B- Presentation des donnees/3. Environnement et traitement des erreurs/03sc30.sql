rem Edition de la confirmation d'une commande
rem Environnement
set echo off
set feed off
set pagesize 60
set newpage 0
set linesize 80

rem Saisie du numéro de la commande

accept vcde number prompt 'N° de la commande à éditer ?'

rem Mise en page

set term off

column refart 	   heading "Référence|article"
column designation heading "Désignation"
column prix	   heading "Prix"
column qtecde      heading "Qté cde"
column nocde  noprint new_value vnocde
column nomcli noprint new_value vnom

break on nocde skip page

compute sum of mt on nocde

ttitle center "Confirmation de commande" skip 2 -
       left "Numero :" vnocde skip 1-
       left "Client :" vnom skip 3

btitle tab 40 "Page " sql.pno

spool confcde.lis
rem Extraction

select commandes.nocde, nomcli, ligcdes.refart, designation,
       prix, qtecde, prix*qtecde as "Mt"
  from commandes, ligcdes, clients, articles
 where commandes.nocde=&vcde
   and commandes.nocli=clients.nocli
   and ligcdes.nocde=commandes.nocde
   and articles.refart=ligcdes.refart 
/
spool off

rem annulation de la mise en page
ttitle off
btitle off
clear columns
clear breaks
clear computes
set pagesize 24
set newpage 1
set feed on
set echo on
set term on