begin
  for vcli in (select nocli, ville from clients) loop
    if (vcli.ville='Nantes') then
      raise_application_error(-20001,'TROUVE');
    end if;
  end loop;
end;
/