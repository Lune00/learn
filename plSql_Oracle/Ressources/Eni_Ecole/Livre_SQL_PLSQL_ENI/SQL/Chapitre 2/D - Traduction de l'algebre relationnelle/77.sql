create table cli (nocli char(4), nomcli char(10));
insert into cli
select to_char(nocli,'0009'), substr(nomcli,1,10)
from clients
where ville like '%PARIS%';
select * from cli;
drop table cli;
