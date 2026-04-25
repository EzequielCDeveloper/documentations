## SSR - Server Side Rendering

Servidor se encarga de renderizar la pagina, pero eso no implica al JS. Una vez el usuario recibe el html, es el mismo usuario el que se encarga de hidratar la pagina al terminar de cargar el js.

## SSG - Static Site Generator

en esta forma, el servidor renderiza previamente la web, y el cliente solamente la solicita.

No sirve para todo. Es principalmente, para paginas estaticas. Si el contenido es volatil, al tener que estar cambiando por una bd, se debe aplicar client side rendering.

## ISSG - Incremental side generation

SSG -> en un intervalo de tiempo, esto con el fin de usar static side generator cada tanto de tiempo y no con alta frecuencia.
