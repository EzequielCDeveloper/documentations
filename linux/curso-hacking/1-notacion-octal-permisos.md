Tienes un archivo, ejemplo, carpeta `testing`

permisos de archivos, para visualizarlos comando: `ls -l`

| rwx  | z-x   | z-x => Testing                                |
| ---- | ----- | --------------------------------------------- |
| 111  | 101   | 101                                           |
| ---- | ----- | ----                                          |
| 7    | 5     | 5 =>Hacer una conversion de binario a decimal |

Ahora nos metemos con los permisos de la carpeta;

`chmod 755 testing` => comando para dar los permisos que actualmente posse => rwx | z-x | z-x

Imagina que le quiero dar permisos de r-x|r--|-w-

| 101 | 100 | 010 |
| --- | --- | --- |
| 200 | 210 | 210 |
| --- | --- | --- |
| 5   | 4   | 2   |

TABLA para entender mejor conversion de permisos:

| rwx | rwx | rwx permisos                                      |
| --- | --- | ------------------------------------------------- |
| 421 | 421 | 421 => valor a cada posicion                      |
| --- | --- | ---                                               |
| 010 | 101 | 001 => ejemplo                                    |
| --- | --- | ---                                               |
| 2   | 5   | 1 => ejemplo de uso. comando: `chmod 251 testing` |

Material de interes: <https://blog.alcancelibre.org/staticpages/index.php/permisos-sistema-de-archivos>
