# Historia del frontend

## Etapa 1: Los primeros pasos (1990-1995)

Tecnologias: HTML - CGI

Practicas:

- Contenido estatico
- Generacion de paginas en el servidor

Malas practicas:

- Codigo estaba mezclado: la logica de presentacion y negocio estaban mezcladas dentro de los scripts del servidor.

Contexto:
Fase inicial, la web estaba en panales. herrramientas, metodologias, eran rudimentarias, la separacion de responsabilidades no era prioridad.

## Etapa 2: Aparicion del CSS y Javascript (1995-2000)

Tecnologias: CSS, Javascript, Flash.

Practicas comunes:

- Estilos en linea.
- scripts en el HTML.

Malas practicas:

- Uso EXCESIVO de FLASH.

Contexto:
La web se volvia cada vez mas interactiva, las mejoras practicas aun no estaban definidas.

PROBLEMAS CON FLASH:

- Accesibilidad.
- Rendimiento.

## Etapa 3: La era de los Frameworks y bibliotecas (2000-2010)

Tecnologias: jQuery, Backbone.js, AngularJs, React

Practicas:

- Manipulacion directa del DOM
- Single Page Applications (SPA): AngularJs, se gana MUCHA popularidad, React.

Competencia entre Frameworks y bibliotecas:

- Backbone (2010)
- AngularJS (2010)
- React (2013)

Malas practicas:

- Carga MASIVA de Javascript => afecta al SEO

Contexto:
La necesidad de aplicaciones que son mas dinamicas.

## Etapa 4: Modularizacion y Bundlers (2010 - 2015)

Tecnologias: Webpack, Browserify, Gulp, ES Modules

Practicas comunes:

- Uso de Bundlers. (empaquetar modulos y recursos)
- Transpiladores: BABEL

Malas practicas:

- Configuraciones complejas.

Contexto:
La comunidad buscaba soluciones para manejar aplicaciones que cada vez eran mas grandes.

## Etapa 5: Meta Frameworks y el RETORNO al RENDERIZADO en el servidor (2015 - 2020)

Tecnologias: Angular 2, React, Vue.js, Next.js, Server-Side-Rendering

Practicas comunes:

- Renderizado hibrido: metaframeworks (Renderizado en el servidor para entregar de forma estatica al servidor)
- Menos Javascript en el Cliente.

Competencia entre Frameworks y bibliotecas:

- Angular 2+ (2016)

## Etapa 6: El futuro (2020 ~)

Tendencia de:

- Minimizar el Javascript en el cliente - Astro / Remix / Qwik.js

Tecnologias:

- Astro (Sitios web enfocados a contenidos. Arquitectura que reduce Javascript por que envia al cliente lo ensencial para la interaccion y el SEO).
- Remix (Maximiza capacidades nativas de la web, delega mayor responsabilidades al servidor)
- Qwik.js (Paradigma resumability, Renderizado bajo demanda)

### herrramientas de Bundling programada en lenguajes de bajo nivel.

- esbuild: Go
- swc: Rust
- rspack: Rust

## IDE

- Etapa 1:
  - Edicion manual.
  - Vim
- Etapa 2:
  - Dreamweaver.
  - Vim
- Etapa 3:
  - Sublime Text.
  - Vim
- Etapa 4:
  - WebStorm(2010)
  - Atom(2014)
  - Vim
- Etapa 5:
  - Visual Studio Code (2015)
  - Intellij IDEA (2001)
  - Vim
- Etapa 6:
  - Visual Studio Code + IA
  - Cursor
  - Windsurf
  - TraeAI
  - Vim
