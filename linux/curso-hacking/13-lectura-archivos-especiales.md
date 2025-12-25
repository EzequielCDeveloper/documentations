## Casos de archivos especiales

En ocaciones sera posible encontrar archivos con nombres extravagantes. Entre estos posibles nombres que se les puede asignar a un archivo se encuentra

- "-"
- "--spaces in this file--"

## Metodos de lectura

- `cat ./-`
- `cat $(pwd)/-`

- `cat "--spaces in this file--"`
- `cat --spaces\ in\ this\ file--`
  bandit3:MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx

bandit2:263JGJPfgU6LtdEvgfWU1XP5yac29mFx
bandit6: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

- `find . -type f ! -executable -size 1033c | xargs cat | xargs`
  - **find .**: Buscar todos los directorios y archivos en el directorio actual.
  - **-type**: Especificar el tipo de archivos a buscar. 'f' de files o archivos y 'd' de directorios o carpetas.
  - **-executable**: Especifica que busque solo archivos que sean ejecutables.
  - **-size**: Especifica el tamamo o peso especifico del archivo a buscar.
    - **1033c**: representacion de 1033 bytes
  - **xargs**: Utilizar el output de lo hecho anteriormente, para el siguiente comando.

- `find . -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null`
  - **find .**: Buscar en todos los archivos
  - **-type**: Indicar el tipo de archivos a buscar.
  - **-executable**: indicas que busque archivos con permisos de ejecucion.
  - **-size**: indicar el tamano o peso del archivo a buscar.
  - **-group**: indicar los usuarios de grupo a buscar.

## REFERENCIAS

[Lista de firmas de archivos](https://en.wikipedia.org/wiki/List_of_file_signatures)
[Como buscar y encontrar archivos en linux?](https://www.ionos.es/digitalguide/servidores/configuracion/comando-linux-find/)
