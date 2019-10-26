alter table membres drop constraint uq_membres;
alter table membres set unused (telephone);
alter table membres drop unused columns;
alter table membres add constraint uq_membres unique (nom, prenom, mobile);
