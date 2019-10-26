ALTER TRIGGER bf_ins_commandes DISABLE;
ALTER TRIGGER bf_ins_commandes ENABLE;
alter table commandes disable all triggers;
alter table commandes enable all triggers;