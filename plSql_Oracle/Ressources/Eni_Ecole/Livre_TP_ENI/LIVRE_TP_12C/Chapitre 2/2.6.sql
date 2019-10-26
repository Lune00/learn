alter table emprunts add(etat char(2) default 'EC');
alter table emprunts add constraint ck_emprunts_etat check (etat in ('EC','RE'));

Update emprunts set etat='RE' where etat='EC' and numero not in (select emprunt from details where rendule is null);