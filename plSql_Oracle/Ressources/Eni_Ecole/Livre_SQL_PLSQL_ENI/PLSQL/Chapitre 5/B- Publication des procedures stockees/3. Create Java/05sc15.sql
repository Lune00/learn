create or replace directory bfile_dir as 'c:\O9i';

create or replace java class using bfile (bfile_dir,'Comptes.class');
/