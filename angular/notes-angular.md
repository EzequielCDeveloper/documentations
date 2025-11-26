- GDE -> Google developer expert -> Angular
- El aprendizaje me parece horrible
- La documentacion es un desastre
- La curva de aprendizaje es muy alta.
- La comunidad de Angular empezo en un declive.

- Backbone -> SPA -> AngularJS => React
- MVC -> M => V => C
- V => M

- MVC + MVVM

- AngularJS => comunidad
- AngularJS => comunidad => directivas
- Plataforma estructural => permite aumentar las funcionalidades en elementos del DOM que ANTES no lo tenian

- directivas => componentes
- AngularJS 14.3 => component

- Angular way => La manera de hacer las cosas segun Angular
- React => un arma de doble dilo => exp + utilizar.

- AngularJS => Angular2

- Angular 16 => soporte Angular 10
- Scripts MIgratorios => Modulos -> Stand Alone Components
- Maximo 6 meses entre versiones.
- Si algo es muy solicitado, y puede hacerse => Apenas lo tengan lo sacan.

- SSR => Server Side Rendering.

- Deteccion de cambios de Angular =>
  - ZoneJs => archivo => detectar cambios.
  - ChangeDetectionStrategy => OnPush => solo detecta cambios en el componente => entradas + interaccion del user.
  - ZoneJs => se va ir.
  - Signals => QuickJS

RESUMABILITY => !
Server => html + js => HTML (No se puede intereactuar) => HTML + JS (Se puede interactuar) Hidratacion
Server => HTML + json => boton -> id: SCRIPT

Component => todo cambia.
component => donde impacta el cambio?

Reactive programming => RxJS

- Canales=> tube que tiene agujeros
- espectadores => van a mirar a traves de esos agujeritos
- Eventos => Se pasa un objeto por el tubo.

### Cada espectador es humana, cada uno es su propio mundo, cada uno ve lo que quiere

Signals => Canales

1. => Alguien tiene que mandar el evento.
2. => Alguien tiene que recibir el evento.

## Quienes se ven impactados por cambios? lso que usen el canal

RxJS => biblioteca que maneja observables

- observables => tubo solo para uno puede mandar una pelota | UNIDIRECCIONAL
- Subject => Tubo donde todo s pueden mandar una pelota.
- BehaviorsSubject => Tubo donde todo pueden mandar una pelota, PERO siempre queda la ultima pelota guardada.

## SSR =>

SERVIDOR => LA INFORMACION AL BROWSER => cache de las interacciones.
No es interactuable => Hidrate.
Partial rendering.

Antes el pipeline para subir el build a produccion era:

=> ssr
=> client

Ahora:

- Las 2 versiones de una.

## Bundler

- minification
- uglify
- bundles (separar el codigo en pedacitos)
- Lazy loading (carga de las cosas que solamente se necesitan)

public/
-> Register
-> login
private/ ----Si no hay login, no lo carga la aplicacion.
-> dashboard
-> profile

Transpilacion
transformacion => codigo de alto nivel a otro de alto nivel.

typescript => Javascript

Bajo => mas parecido a lenguaje maquina va a ser => binario.

/webpack => Babel

transpilacion, lo hace vite.js
