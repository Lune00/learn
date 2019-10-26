alter table ARTICLES
add constraint ARTICLES_PRIX_CK check (PRIX>=0);
