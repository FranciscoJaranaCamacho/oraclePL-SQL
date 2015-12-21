26. Realiza un procedimiento llamado PermisosdeAsobreB que reciba dos nombres de usuario y muestre los permisos que tiene el primero de ellos sobre objetos del segundo.

create or replace procedure PermisosdeAsobreB (p_user1 varchar2, p_user2 varchar2)
is

cursor c_privyobje is select privilege, table_name
                      from dba_tab_privs
                      where grantee = p_user1 and
                      owner = p_user2;

begin

for a in c_privyobje loop
	dbms_output.put_line('El usuario '||p_user1||' tiene privilegio de '||a.privilege||' sobre la tabla '||a.table_name||' del usuario '||p_user2);
end loop;

end;
/
