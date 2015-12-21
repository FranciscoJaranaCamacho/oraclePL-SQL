24. Realiza una función de verificación de contraseñas que compruebe que la contraseña difiere en más de tres caracteres de la anterior y que la longitud de la misma es diferente de la anterior. Asígnala al perfil CONTRASEÑASEGURA. Comprueba que funciona correctamente.

Create or replace function verificar_pass (p_usuario varchar2, p_nueva varchar2, p_antigua varchar2)
return boolean
as

v_veces	number := 0;
antlength number;
nuelength number;

begin

antlength := length(p_antigua);
nuelength := length(p_nueva);

for a in 1..nuelength loop
	if substr(p_nueva, a, 1) = substr(p_antigua, a, 1) then
		v_veces := v_veces + 1;
	end if;
end loop;

if v_veces > 2 then
	raise_application_error(-20001, 'La contraseña nueva debe diferir en 3 caracteres respecto de la anterior');
elsif nuelength = antlength then
	raise_application_error(-20002, 'La longitud de la contraseña nueva no puede ser igual que la contraseña antigua');
end if;

return (TRUE);

end;
/

alter profile CONTRASENASEGURA limit PASSWORD_VERIFY_FUNCTION verificar_pass;
