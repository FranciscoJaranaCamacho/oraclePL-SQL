create or replace procedure MostrarInfoPerfil (p_perfil varchar2)
is

cursor c_datosperfil is select resource_name, resource_type, limit
						from dba_profiles
						where profile = p_perfil;

cursor c_usersperfil is select username
						from dba_users
						where profile = p_perfil;

begin

dbms_output.put_line('Esta es la composición del perfil '||p_perfil||':');
dbms_output.put_line('Nombre del recurso'||chr(9)||'Tipo del recurso'||chr(9)||'Límite');

for a in c_datosperfil loop
	dbms_output.put_line(a.resource_name||chr(9)||a.resource_type||chr(9)||a.limit);
end loop;

dbms_output.put_line(chr(10));
dbms_output.put_line('Estos son los usuarios que tienen asignado este perfil :');

for b in c_usersperfil loop
	dbms_output.put_line(b.username);
end loop;

end;
/
