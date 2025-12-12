# Hoja de referencia de Vim (español)

## Global

| Comando             | Descripción                                                                    |
| ------------------- | ------------------------------------------------------------------------------ |
| `:h[elp] palabra`   | abrir ayuda para _palabra_                                                     |
| `:sav[eas] archivo` | guardar archivo con otro nombre                                                |
| `:clo[se]`          | cerrar el panel actual                                                         |
| `:ter[minal]`       | abrir una ventana de terminal                                                  |
| `K`                 | abrir página del manual para la palabra bajo el cursor                         |
| **Consejo**         | Ejecuta `vimtutor` en una terminal para aprender los primeros comandos de Vim. |

## Movimiento del cursor

| Comando      | Descripción                                                                         |
| ------------ | ----------------------------------------------------------------------------------- |
| `h`          | mover cursor a la izquierda                                                         |
| `j`          | mover cursor hacia abajo                                                            |
| `k`          | mover cursor hacia arriba                                                           |
| `l`          | mover cursor a la derecha                                                           |
| `gj`         | bajar una línea en texto multilínea                                                 |
| `gk`         | subir una línea en texto multilínea                                                 |
| `H`          | ir al inicio de la pantalla                                                         |
| `M`          | ir al centro de la pantalla                                                         |
| `L`          | ir al final de la pantalla                                                          |
| `w`          | avanzar al comienzo de la siguiente palabra                                         |
| `W`          | avanzar al comienzo de la siguiente palabra (incluye puntuación)                    |
| `e`          | avanzar al final de la palabra                                                      |
| `E`          | avanzar al final de la palabra (incluye puntuación)                                 |
| `b`          | retroceder al comienzo de la palabra anterior                                       |
| `B`          | retroceder al comienzo de la palabra anterior (incluye puntuación)                  |
| `ge`         | retroceder al final de la palabra anterior                                          |
| `gE`         | retroceder al final de la palabra anterior (incluye puntuación)                     |
| `%`          | saltar al carácter coincidente (`()`, `{}`, `[]`)                                   |
| `0`          | ir al inicio de la línea                                                            |
| `^`          | ir al primer carácter no blanco de la línea                                         |
| `$`          | ir al final de la línea                                                             |
| `g_`         | ir al último carácter no blanco de la línea                                         |
| `gg`         | ir a la primera línea del documento                                                 |
| `G`          | ir a la última línea del documento                                                  |
| `5gg` o `5G` | ir a la línea 5                                                                     |
| `gd`         | ir a la declaración local                                                           |
| `gD`         | ir a la declaración global                                                          |
| `fx`         | saltar a la siguiente aparición del carácter _x_                                    |
| `tx`         | saltar justo antes de la siguiente aparición de _x_                                 |
| `Fx`         | saltar a la aparición previa de _x_                                                 |
| `Tx`         | saltar justo después de la aparición previa de _x_                                  |
| `;`          | repetir el último movimiento `f`, `t`, `F` o `T`                                    |
| `,`          | repetir el último movimiento `f`, `t`, `F` o `T` en sentido inverso                 |
| `}`          | saltar al siguiente párrafo (o bloque/función en código)                            |
| `{`          | saltar al párrafo anterior (o bloque/función en código)                             |
| `zz`         | centrar el cursor en la pantalla                                                    |
| `zt`         | colocar el cursor en la parte superior de la pantalla                               |
| `zb`         | colocar el cursor en la parte inferior de la pantalla                               |
| `Ctrl‑e`     | desplazar la pantalla una línea hacia abajo (sin mover el cursor)                   |
| `Ctrl‑y`     | desplazar la pantalla una línea hacia arriba (sin mover el cursor)                  |
| `Ctrl‑b`     | desplazar una página hacia arriba (el cursor queda en la última línea)              |
| `Ctrl‑f`     | desplazar una página hacia abajo (el cursor queda en la primera línea)              |
| `Ctrl‑d`     | mover cursor y pantalla medio‑página hacia abajo                                    |
| `Ctrl‑u`     | mover cursor y pantalla medio‑página hacia arriba                                   |
| **Consejo**  | Prefija cualquier comando de movimiento con un número para repetirlo (p.ej., `4j`). |

## Modo Inserción – Insertar/Anexar texto

| Comando          | Descripción                                                      |
| ---------------- | ---------------------------------------------------------------- |
| `i`              | insertar antes del cursor                                        |
| `I`              | insertar al comienzo de la línea                                 |
| `a`              | anexar después del cursor                                        |
| `A`              | anexar al final de la línea                                      |
| `o`              | abrir una nueva línea debajo de la actual                        |
| `O`              | abrir una nueva línea encima de la actual                        |
| `ea`             | anexar al final de la palabra                                    |
| `Ctrl‑h`         | borrar el carácter anterior al cursor                            |
| `Ctrl‑w`         | borrar la palabra anterior al cursor                             |
| `Ctrl‑j`         | insertar salto de línea en la posición del cursor                |
| `Ctrl‑t`         | sangrar (mover a la derecha) una unidad de _shiftwidth_          |
| `Ctrl‑d`         | des‑sangrar (mover a la izquierda) una unidad de _shiftwidth_    |
| `Ctrl‑n`         | autocompletar la coincidencia siguiente                          |
| `Ctrl‑p`         | autocompletar la coincidencia anterior                           |
| `Ctrl‑r x`       | insertar el contenido del registro _x_                           |
| `Ctrl‑o x`       | entrar temporalmente en modo normal para ejecutar el comando _x_ |
| `Esc` o `Ctrl‑c` | salir del modo inserción                                         |

## Edición

| Comando     | Descripción                                        |
| ----------- | -------------------------------------------------- |
| `r`         | reemplazar un solo carácter                        |
| `R`         | reemplazar varios caracteres hasta `Esc`           |
| `J`         | unir la línea siguiente a la actual con un espacio |
| `gJ`        | unir la línea siguiente a la actual sin espacio    |
| `gwip`      | reformatear el párrafo                             |
| `g~`        | cambiar mayúsculas/minúsculas según movimiento     |
| `gu`        | pasar a minúsculas según movimiento                |
| `gU`        | pasar a mayúsculas según movimiento                |
| `cc`        | cambiar (reemplazar) toda la línea                 |
| `c$` o `C`  | cambiar hasta el final de la línea                 |
| `ciw`       | cambiar toda la palabra                            |
| `cw` o `ce` | cambiar hasta el final de la palabra               |
| `s`         | borrar carácter y sustituir texto (igual que `cl`) |
| `S`         | borrar línea y sustituir texto (igual que `cc`)    |
| `xp`        | transponer dos letras (borrar y pegar)             |
| `u`         | deshacer                                           |
| `U`         | restaurar (deshacer) la última línea cambiada      |
| `Ctrl‑r`    | rehacer                                            |
| `.`         | repetir el último comando                          |

## Modo Visual – Selección de texto

| Comando          | Descripción                                                          |
| ---------------- | -------------------------------------------------------------------- |
| `v`              | iniciar modo visual (selección carácter)                             |
| `V`              | iniciar modo visual por líneas                                       |
| `o`              | mover el cursor al extremo opuesto de la selección                   |
| `Ctrl‑v`         | iniciar modo visual en bloque                                        |
| `O`              | mover al otro extremo del bloque                                     |
| `aw`             | seleccionar una palabra completa                                     |
| `ab`             | seleccionar bloque delimitado por `()`                               |
| `aB`             | seleccionar bloque delimitado por `{}`                               |
| `at`             | seleccionar bloque delimitado por `< >`                              |
| `ib`             | seleccionar interior de `()`                                         |
| `iB`             | seleccionar interior de `{}`                                         |
| `it`             | seleccionar interior de `< >`                                        |
| `Esc` o `Ctrl‑c` | salir del modo visual                                                |
| **Consejo**      | En lugar de `b` o `B` también puedes usar `(` o `{` respectivamente. |

## Comandos Visuales

| Comando | Descripción                                          |
| ------- | ---------------------------------------------------- |
| `>`     | sangrar a la derecha                                 |
| `<`     | sangrar a la izquierda                               |
| `y`     | copiar (yank) el texto seleccionado                  |
| `d`     | borrar el texto seleccionado                         |
| `~`     | cambiar mayúsculas/minúsculas del texto seleccionado |
| `u`     | pasar a minúsculas el texto seleccionado             |
| `U`     | pasar a mayúsculas el texto seleccionado             |

## Registros

| Comando                  | Descripción                                                                                                                                                                                                                                                                                                                                                                     |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `:reg[isters]`           | mostrar contenido de los registros                                                                                                                                                                                                                                                                                                                                              |
| `"xy`                    | copiar al registro _x_                                                                                                                                                                                                                                                                                                                                                          |
| `"xp`                    | pegar contenido del registro _x_                                                                                                                                                                                                                                                                                                                                                |
| `"+y`                    | copiar al registro del portapapeles del sistema                                                                                                                                                                                                                                                                                                                                 |
| `"+p`                    | pegar desde el registro del portapapeles del sistema                                                                                                                                                                                                                                                                                                                            |
| **Consejo**              | Los registros se guardan en `~/.viminfo` y se recargan al reiniciar Vim.                                                                                                                                                                                                                                                                                                        |
| **Registros especiales** | `0` último yank, `"` registro sin nombre (último delete o yank), `%` nombre del archivo actual, `#` nombre del archivo alternativo, `*` contenido del portapapeles primario (X11), `+` contenido del portapapeles (X11), `/` último patrón buscado, `:` último comando de línea, `.` último texto insertado, `-` último borrado pequeño, `=` expresión, `_` registro “agujero”. |

## Marcas y Posiciones

| Comando     | Descripción                                                                                                        |
| ----------- | ------------------------------------------------------------------------------------------------------------------ |
| `:marks`    | listar marcas                                                                                                      |
| `ma`        | establecer marca _A_ en la posición actual                                                                         |
| `` `a``     | saltar a la posición de la marca _A_                                                                               |
| `y`a`       | copiar texto hasta la posición de la marca _A_                                                                     |
| `` `0``     | ir a la posición donde Vim se cerró por última vez                                                                 |
| `` `"``     | ir a la posición del último edición de este archivo                                                                |
| `` `.``     | ir a la posición del último cambio en este archivo                                                                 |
| ` ` ``      | ir a la posición antes del último salto                                                                            |
| `:ju[mps]`  | listar saltos                                                                                                      |
| `Ctrl‑i`    | ir al salto más reciente                                                                                           |
| `Ctrl‑o`    | ir al salto anterior                                                                                               |
| `:changes`  | listar cambios                                                                                                     |
| `g,`        | ir al cambio más reciente                                                                                          |
| `g;`        | ir al cambio anterior                                                                                              |
| `Ctrl‑]`    | saltar a la etiqueta bajo el cursor                                                                                |
| **Consejo** | Usa `` ` `` (acento grave) o `'` (apóstrofe) para saltar a una marca; `'` lleva al inicio de la línea de la marca. |

## Macros

| Comando | Descripción                                |
| ------- | ------------------------------------------ |
| `qa`    | comenzar a grabar macro en el registro _a_ |
| `q`     | detener la grabación                       |
| `@a`    | ejecutar macro _a_                         |
| `@@`    | volver a ejecutar la última macro usada    |

## Cortar y pegar

| Comando          | Descripción                                                                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `yy`             | copiar (yank) una línea                                                                                                            |
| `2yy`            | copiar dos líneas                                                                                                                  |
| `yw`             | copiar caracteres de la palabra hasta el inicio de la siguiente palabra                                                            |
| `yiw`            | copiar la palabra bajo el cursor                                                                                                   |
| `yaw`            | copiar la palabra y el espacio adyacente                                                                                           |
| `y$` o `Y`       | copiar hasta el final de la línea                                                                                                  |
| `p`              | pegar después del cursor                                                                                                           |
| `P`              | pegar antes del cursor                                                                                                             |
| `gp`             | pegar después del cursor y dejar el cursor tras el texto pegado                                                                    |
| `gP`             | pegar antes del cursor y dejar el cursor tras el texto pegado                                                                      |
| `dd`             | borrar (cortar) una línea                                                                                                          |
| `2dd`            | borrar dos líneas                                                                                                                  |
| `dw`             | borrar caracteres de la palabra hasta el inicio de la siguiente palabra                                                            |
| `diw`            | borrar la palabra bajo el cursor                                                                                                   |
| `daw`            | borrar la palabra y el espacio adyacente                                                                                           |
| `:3,5d`          | borrar líneas 3 a 5                                                                                                                |
| **Consejo**      | Puedes especificar rangos con `:.,$d` (de la línea actual al final), `:.,1d` (hasta el principio), `:10,1d` (de la 10ª al inicio). |
| `:g/{patrón}/d`  | borrar todas las líneas que contengan _patrón_                                                                                     |
| `:g!/{patrón}/d` | borrar todas las líneas que **no** contengan _patrón_                                                                              |
| `d$` o `D`       | borrar hasta el final de la línea                                                                                                  |
| `x`              | borrar (cortar) un carácter                                                                                                        |

## Sangrado de texto

| Comando | Descripción                                                              |
| ------- | ------------------------------------------------------------------------ |
| `>>`    | sangrar una línea a la derecha una unidad de _shiftwidth_                |
| `<<`    | des‑sangrar una línea a la izquierda una unidad de _shiftwidth_          |
| `>%`    | sangrar bloque delimitado por `()` o `{}` (con el cursor sobre la llave) |
| `<%`    | des‑sangrar bloque delimitado por `()` o `{}`                            |
| `>ib`   | sangrar bloque interno `()`                                              |
| `>at`   | sangrar bloque delimitado por `< >`                                      |
| `3==`   | re‑sangrar tres líneas                                                   |
| `=%`    | re‑sangrar bloque `()` o `{}` (con cursor sobre la llave)                |
| `=iB`   | re‑sangrar bloque interno `{}`                                           |
| `gg=G`  | re‑sangrar todo el buffer                                                |
| `]p`    | pegar y ajustar el sangrado al nivel actual                              |

## Salida

| Comando             | Descripción                              |
| ------------------- | ---------------------------------------- |
| `:w`                | escribir (guardar) el archivo sin salir  |
| `:w !sudo tee %`    | guardar el archivo actual usando _sudo_  |
| `:wq` o `:x` o `ZZ` | escribir y salir                         |
| `:q`                | salir (falla si hay cambios sin guardar) |
| `:q!` o `ZQ`        | salir descartando cambios sin guardar    |
| `:wqa`              | escribir y salir de todas las pestañas   |

## Buscar y reemplazar

| Comando              | Descripción                                                                           |
| -------------------- | ------------------------------------------------------------------------------------- |
| `/patrón`            | buscar _patrón_ hacia adelante                                                        |
| `?patrón`            | buscar _patrón_ hacia atrás                                                           |
| `\vpatrón`           | “muy mágico”: los símbolos no alfanuméricos son regex especiales (no necesita escape) |
| `n`                  | repetir búsqueda en la misma dirección                                                |
| `N`                  | repetir búsqueda en dirección opuesta                                                 |
| `:%s/viejo/nuevo/g`  | reemplazar todas las ocurrencias en todo el archivo                                   |
| `:%s/viejo/nuevo/gc` | lo mismo, pero confirmando cada sustitución                                           |
| `:noh[lsearch]`      | eliminar resaltado de coincidencias de búsqueda                                       |

## Buscar en varios archivos

| Comando                          | Descripción                                                     |
| -------------------------------- | --------------------------------------------------------------- |
| `:vim[grep] /patrón/ {archivos}` | buscar _patrón_ en varios archivos (ej.: `:vimgrep /foo/ **/*`) |
| `:cn[ext]`                       | ir al siguiente resultado                                       |
| `:cp[revious]`                   | ir al resultado anterior                                        |
| `:cope[n]`                       | abrir ventana con la lista de resultados                        |
| `:ccl[ose]`                      | cerrar la ventana _quickfix_                                    |

## Pestañas

| Comando                         | Descripción                                                               |
| ------------------------------- | ------------------------------------------------------------------------- |
| `:tabnew` o `:tabnew {archivo}` | abrir un archivo en una nueva pestaña                                     |
| `Ctrl‑wT`                       | mover la ventana dividida actual a su propia pestaña                      |
| `gt` o `:tabn[ext]`             | ir a la pestaña siguiente                                                 |
| `gT` o `:tabp[revious]`         | ir a la pestaña anterior                                                  |
| `#gt`                           | ir a la pestaña número _#_                                                |
| `:tabm[ove] #`                  | mover la pestaña actual a la posición _#_ (indexado desde 0)              |
| `:tabc[lose]`                   | cerrar la pestaña actual y sus ventanas                                   |
| `:tabo[nly]`                    | cerrar todas las pestañas excepto la actual                               |
| `:tabdo comando`                | ejecutar _comando_ en todas las pestañas (p.ej., `:tabdo q` cierra todas) |

## Trabajo con varios archivos

| Comando              | Descripción                                                             |
| -------------------- | ----------------------------------------------------------------------- |
| `:e[dit] archivo`    | editar _archivo_ en un nuevo buffer                                     |
| `:bn[ext]`           | ir al buffer siguiente                                                  |
| `:bp[revious]`       | ir al buffer anterior                                                   |
| `:bd[elete]`         | borrar (cerrar) un buffer                                               |
| `:b[uffer]#`         | ir al buffer por índice _#_                                             |
| `:b[uffer] archivo`  | ir al buffer que contiene _archivo_                                     |
| `:ls` o `:buffers`   | listar todos los buffers abiertos                                       |
| `:sp[lit] archivo`   | abrir _archivo_ en un nuevo buffer y dividir la ventana horizontalmente |
| `:vs[plit] archivo`  | abrir _archivo_ en un nuevo buffer y dividir la ventana verticalmente   |
| `:vert[ical] ba[ll]` | editar todos los buffers como ventanas verticales                       |
| `:tab ba[ll]`        | editar todos los buffers como pestañas                                  |
| `Ctrl‑ws`            | dividir la ventana                                                      |
| `Ctrl‑wv`            | dividir la ventana verticalmente                                        |
| `Ctrl‑ww`            | cambiar entre ventanas                                                  |
| `Ctrl‑wq`            | cerrar una ventana                                                      |
| `Ctrl‑wx`            | intercambiar la ventana actual con la siguiente                         |
| `Ctrl‑w=`            | hacer todas las ventanas del mismo tamaño                               |
| `Ctrl‑wh`            | mover el cursor a la ventana izquierda (división vertical)              |
| `Ctrl‑wl`            | mover el cursor a la ventana derecha (división vertical)                |
