alter table membres add mobile char(10);
alter table membres add constraint ck_membres_mobile check (mobile like '06%' or mobile like '07%');
