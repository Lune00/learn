create or replace function factorielle( n in number)
  return number is
  begin
    if n=0 then
      return (1);
    else
      return (n*factorielle(n-1));
    end if;
  end;
/