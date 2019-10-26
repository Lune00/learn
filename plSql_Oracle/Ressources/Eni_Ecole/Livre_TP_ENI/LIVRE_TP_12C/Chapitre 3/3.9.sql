
ALTER TABLE membres DROP constraint ck_membres_mobile; 

-- le script présent dans le fichier utlexcpt.sql
rem 
rem $Header: utlexcpt.sql,v 1.1 1992/10/20 11:57:02 GLUMPKIN Stab $ 
rem 
Rem  Copyright (c) 1991 by Oracle Corporation 
Rem    NAME
Rem      except.sql - <one-line expansion of the name>
Rem    DESCRIPTION
Rem      <short description of component this file declares/defines>
Rem    RETURNS
Rem 
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem    MODIFIED   (MM/DD/YY)
Rem     glumpkin   10/20/92 -  Renamed from EXCEPT.SQL 
Rem     epeeler    07/22/91 -         add comma 
Rem     epeeler    04/30/91 -         Creation 

create table exceptions(row_id rowid,
	                owner varchar2(30),
	                table_name varchar2(30),
		        constraint varchar2(30));

-- la suite de la correction de l'exercice
ALTER TABLE membres add constraint ck_membres_mobile check (regexp_like (mobile, '^(06|07) [[:digit:]]{2} [[:digit:]]{2} [[:digit:]]{2} [[:digit:]]{2}$')) EXCEPTIONS INTO EXCEPTIONS;

SELECT * FROM membres WHERE rowid IN (SELECT row_id FROM exceptions WHERE constraint='CK_MEMBRES_MOBILE');

DELETE FROM exceptions WHERE constraint ='CK_MEMBRES_MOBILE';
