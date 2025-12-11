`touch file.txt`
`ls`
Para agregar contenido a este archivo, comando:
`echo "Hola probando" > file.txt` => los '>' se le conoce como redirector
`batcat file.txt` => output: 'Hola probando'
El problema con usar solo '>' es que sobreescribira el contenido del archivo.

Para no sobreescribir, si no mas bien agregar contenido, comando:
`echo "extra extra!" >> file.txt` => con doble redirector '>>', indicas que deseas agregar(append).

---

`ls -l` => lista estructura de archivos, fecha de creacion, propietarios y permisos.

| rwx         | rwx   | rwx   |
| ----------- | ----- | ----- |
| propietario | grupo | otros |

| r   | Read    |
| --- | ------- |
| w   | write   |
| x   | execute |
