## contexto: existe usuario 'root', usuario 'anon' y usuario 'pepe'

`sudo su`
`mdkir prueba`

cambiar propietario:
`chmod pepe:pepe prueba` => ahora el propietario y el grupo es pepe

`chmod g+w,o+w prueba` => Se cambian permisos para que los grupos puedan escribir y 'otros' puedan escribir tambien.

`su pepe`
`echo Hola probando > file.txt` => se crea un archivo

Los permisos que puede atender un archivo dentro de una carpeta, si la carpeta autoriza - el sistema dara prioridad de permisos a los de la carpeta sobre los permiso que contenga su contenido. Ejemplo:

Prueba(carpeta) - Tiene permisos para otros => hola.txt - no tiene permisos para otros.

En el ejemplo anterior, 'otros', serian capaces de borrar dicha carpeta.

para evitar lo anterior usar:

`chmod +t pruebas/`

## Referencia

<https://rm-rf.es/chattr-y-lsattr-visualizar-y-modificar-atributos-en-sistemas-de-ficheros-linux/#:~:text=El%20primer%20comando%2C%20lsattr%20permite,chmod%2C%20chown%2Csetfacl%E2%80%A6)>

<https://programmerclick.com/article/5604675172/>
