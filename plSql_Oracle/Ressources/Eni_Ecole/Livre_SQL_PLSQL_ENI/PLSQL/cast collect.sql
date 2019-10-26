create type catalogue as table of varchar2(30);
/
select cast(collect(designation) as catalogue)
from articles;