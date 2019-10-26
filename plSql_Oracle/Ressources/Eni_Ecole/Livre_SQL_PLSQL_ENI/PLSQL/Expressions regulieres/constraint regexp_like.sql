alter table articles
add constraint ck_refart
check(regexp_like(refart,'^[[:upper:]]{2,}'));