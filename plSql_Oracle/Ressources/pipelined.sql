create type t_Mtsal as object(numemp number(4),
                              salaire number(7,2));
create type t_MtsalTab as TABLE OF t_Mtsal;

create or replace function f_sal (c_lig in sys_refcursor)
    return t_MtsalTab PIPELINED IS
v_sal t_Mtsal:=t_Mtsal(null,null);
v_emp emp%rowtype;
begin
    loop
    fetch c_lig into v_emp;
    exit when c_lig%notfound;
    v_sal.numemp:=v_emp.empno;
    v_sal.salaire:=v_emp.sal*1.1;
    PIPE ROW(v_sal);
    end loop;
return;
end;
/
select numemp,salaire
from table(f_sal(CURSOR(select * from emp)));