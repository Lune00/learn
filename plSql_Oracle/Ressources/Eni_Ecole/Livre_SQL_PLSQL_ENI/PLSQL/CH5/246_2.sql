CREATE OR REPLACE TRIGGER tr_af_ins_lignescde
 AFTER INSERT ON LIGNESCDE
 FOR EACH ROW
 CALL MAJSTOCK(:new.refart, :new.qtecde)
/

