- `sudo su`
- `python3.9`
- `which python3.9` => output:"/usr/bin/python3.9"
- `which python3.9 | xargs ls -l` => 'xargs' ayuda a realizar tareas de forma paralela
- `chmod u+s /usr/bin/python3.9`
  Ahora si se mira los permisos algo como:
  `-rwsr-xr-x` => esa 's'(permiso SUID) que implica?

Si ahora, como otro usuario normal, nos dirigimos a la carpeta:

`find / -type f -perm -4000 2>/dev/null` => 2>/dev/null los errores que arroje el comando, los dirigimos a null para que no aparezcan en el output.
Con el comando anterior, se buscan binarios SUID a los cuales como usuario no privilegiado, tenga acceso.

## Que implican los privilegios SUID?

Los usuarios no privilegiados, son capaces de ejecutar dichos binarios SUID, como si fueran el usuario privilegiado(root)

---

## PERMISOS SGID

`find / -perm -2000 2>/dev/null` => output: actividades quie estan corriendo bajo el grupo root

## Referencias

[Permisos SGID, SUID y Sticky bit](https://deephacking.tech/permisos-sgid-suid-y-sticky-bit-linux/#:~:text=Permiso%20SGID,-El%20permiso%20SGID&text=Si%20se%20establece%20en%20un,perteneciente%2C%20el%20grupo%20del%20directorio.)
[Permisos especiales en Linux - Sticky Bit, SUID y SGID](https://www.ochobitshacenunbyte.com/2019/06/17/permisos-especiales-en-linux-sticky-bit-suid-y-sgid/)
[Los bits SUID, SGID y Sticky](https://www.ibiblio.org/pub/linux/docs/LuCaS/Manuales-LuCAS/SEGUNIX/unixsec-2.1-html/node56.html)
