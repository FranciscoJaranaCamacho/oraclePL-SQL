create or replace procedure MostrarObjetosAccesibles (p_usuario varchar2)
is

cursor c_objetos is select table_name
                    from dba_tab_privs
                    where grantee = p_usuario or owner = p_usuario;

begin

dbms_output.put_line('Estos son los objetos a los que tiene acceso el usuario '||p_usuario||':');

for a in c_objetos loop
	dbms_output.put_line(a.table_name);
end loop;

end;
/
