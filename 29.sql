create or replace procedure MostrarNumSesiones (p_usuario varchar2)
is

cursor c_perfiles is select profile, limit
                     from dba_profiles
                     where resource_name = 'SESSIONS_PER_USER' and profile in (select profile
                                                                               from dba_users
                                                                               where username = 'USRPRACTICA1');

v_perfil dba_users.profile%type;
v_numsesiones dba_profiles.resource_name%type;

begin

fetch c_perfiles.profile into v_perfil;
fetch c_perfiles.limit into v_numsesiones;

/*select profile into v_perfil, limit into v_numsesiones
from dba_profiles
where resource_name = 'SESSIONS_PER_USER' and profile in (select profile
                                                          from dba_users
                                                          where username = 'USRPRACTICA1');*/

if v_perfil != 'DEFAULT' or v_perfil != 'UNLIMITED' then
	dbms_output.put_line('El usuario '||p_usuario||' puede tener un máximo de '||v_numsesiones||' sesiones concurrentes.');
else
	dbms_output.put_line('El usuario seleccionado no tiene asignado un perfil que limite el número de sesiones concurrentes o puede tener ilimitadas sesiones concurrentes.');
end if;

end;
/
