# Archivos Adicionales Recomendados para Freelancers

Una vez que domines los archivos básicos, agregar estos documentos elevará el nivel de tus entregas y te ahorrará dolores de cabeza futuros con clientes o mantenimientos.

## 1. El Protector Legal: `LICENSE.md`

**Ubicación:** Raíz del proyecto.
**Por qué es útil:** Aunque el proyecto sea privado para un cliente, debes definir la propiedad intelectual.

- **Si es código abierto:** Usas licencias como MIT o GNU GPL.
- **Si es para un cliente:** Aquí especificas que el código pasa a ser propiedad del cliente _una vez realizado el pago final_, o si tú retienes derechos sobre ciertas librerías.
- **Tip:** Evita que un cliente revenda tu trabajo sin tu permiso si no fue eso lo acordado.

## 2. El Vendedor de Futuro: `ROADMAP.md` (o `TODO.md`)

**Ubicación:** Raíz o carpeta `docs/`.
**Por qué es útil:** Gestiona el "Scope Creep" (cuando el cliente pide más cosas gratis).

- **Contenido:** Lista de ideas o funciones que se le ocurrieron al cliente pero que **no** entran en el pago actual.
- **Estrategia:** Cuando el cliente diga "¿Podemos agregar esto?", tú dices: "Claro, pero no está en el presupuesto actual. Lo anoto en el `ROADMAP.md` para la Fase 2".
- **Estructura sugerida:**
  - `## Pendientes (Próxima Cotización)`
  - `## Ideas a futuro`
  - `## Mejoras técnicas deseadas`

## 3. El Mapa del Tesoro: `docs/ARQUITECTURA.md`

**Ubicación:** Carpeta `docs/`.
**Por qué es útil:** Para cuando tengas que volver al proyecto 6 meses después o si contratas ayuda.

- **Contenido:**
  - Diagrama de la base de datos (Qué tablas se relacionan con cuáles).
  - Estructura de carpetas explicada (¿Qué va en `controllers`?, ¿Qué va en `views`?).
  - Flujo de datos (Cómo viaja la información desde el formulario hasta la base de datos).
- **Nivel:** Intermedio/Avanzado.

## 4. El Salvador de Soporte: `docs/FAQ.md` (o `TROUBLESHOOTING.md`)

**Ubicación:** Carpeta `docs/`.
**Por qué es útil:** Reduce las llamadas y mensajes del cliente preguntando lo mismo.

- **Contenido:** Solución a problemas comunes que no son "bugs", sino errores de uso o configuración.
- **Ejemplos:**
  - "¿Por qué no me llegan los correos?" -> "Verifica la carpeta SPAM o la configuración SMTP".
  - "¿Cómo recupero un usuario borrado?" -> "No se puede, debes crearlo de nuevo".
  - "Error de conexión a BD" -> "Verifica que el servicio X esté encendido".

## 5. La Biblia de la API: `docs/API.md`

**Ubicación:** Carpeta `docs/`.
**Por qué es útil:** Solo si tu proyecto tiene un Backend que se comunica con un Frontend o con otros sistemas.

- **Contenido:** Documentación de los "Endpoints".
- **Formato:**
  - `GET /usuarios`: Obtiene lista de usuarios.
  - `POST /usuarios`: Crea un usuario.
  - **Parametros requeridos:** (Ej: email, password).
  - **Respuesta esperada:** (Ej: JSON con datos del usuario).

## 6. Guía de Mantenimiento: `docs/MANTENIMIENTO.md`

**Ubicación:** Carpeta `docs/`.
**Por qué es útil:** Define cómo cuidar el software a largo plazo.

- **Contenido:**
  - Cómo hacer copias de seguridad (Backups) de la base de datos.
  - Cómo actualizar las librerías de seguridad.
  - Cómo renovar certificados SSL.
  - Dónde ver los "logs" de errores cuando el sistema falla.

---

## Ejemplo de Estructura de Carpetas Ampliada

Si decides usar todos, tu proyecto se vería así de profesional:

proyecto/
│
├── LICENSE.md <-- Legalidad
├── README.md <-- Resumen general
├── CHANGELOG.md <-- Historial
├── ROADMAP.md <-- Ventas futuras / Ideas
├── src/
│
└── docs/
├── ALCANCE.md <-- Contrato funcional
├── INSTALACION.md <-- Para desarrolladores
├── MANUAL_USUARIO.md <-- Para el cliente
├── ARQUITECTURA.md <-- Estructura interna
├── API.md <-- Conexiones técnicas (si aplica)
└── FAQ.md <-- Solución de problemas comunes
