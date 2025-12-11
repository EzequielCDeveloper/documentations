Para realizar busquedas de ejecutables, archivos capacidades de escritura, por nombre, entre otros elementos.

`find / -name  passwd 2>/dev/null | xargs ls -l`

- con find iniciamos la busqueda
- con / indicamos que desde la raiz del sistema
- -name para buscar por matches de nombre nombre de archivo del resultado final
- passwd para buscar martch con passwd
- 2>/dev/null es para errores no aparezcan en pantalla
- con xargs indicamos que de forma paralela haga:
  - ls -l , listar archivos y permisos.

`find / -perm -4000 2>/dev/null`

- -perm indicas al find que busque por permisos, -4000 es el permiso a buscar

`find / -group anon -type f 2>/dev/null`

- -group indicamos que la busqueda sea atraves de grupos
- anon, es el nombre de usuario a buscar
- -type indicamos que busque un tipo especifico de elemento.
- f, indicamos que busque un file o archivo
- d, indicamos que busqe un directorio.

`find / -user root -writable 2>/dev/null`

- -user indicamos que busque por usuarios
- root, indicamos que busque el usuario root.
- -writable, indicamos que busque los archivos que tengan capacidad de escritura.

`find / -user root -executable type f 2>/dev/null`

- -executable , con esto buscamos archivos que sean ejecutables.

`find / -name dex\* 2>/dev/null`

- -name, indicamos busqueda por nombre.
- dex(es posible usar, cualquier otra cosa par nuestra busqueda)
- '\*' con esto indicamos que muestre los resulatados que comiencen con lo anterior al slash
  - tambien es posible colocar '\*' tanto al inicio como al final de lo que vayamos a buscar, que haga match.

`find --help`

con esto solicitamos una guia rapida de la informacion del comando find

---

REFERENCIAS:
[Comandos find y locate en Linux](https://www.hostinger.es/tutoriales/como-usar-comando-find-locate-en-linux/)
