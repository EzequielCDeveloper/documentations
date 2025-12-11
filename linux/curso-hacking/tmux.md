## Comparacion de terminales

| Característica            | tmux                                                                          | Zsh                                                                                     | Bash                                                           |
| ------------------------- | ----------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | -------------------------------------------------------------- |
| **Tipo**                  | Multiplexor de terminal                                                       | Shell (intérprete de comandos)                                                          | Shell (intérprete de comandos)                                 |
| **Objetivo principal**    | Gestionar múltiples sesiones y paneles en una sola terminal                   | Mejorar la experiencia de línea de comandos con completado avanzado, globbing y plugins | Compatibilidad y scripting POSIX, uso general en sistemas Unix |
| **Gestión de sesiones**   | Sí – permite crear, nombrar y volver a sesiones                               | No (pero puede usar `screen`/`tmux` para eso)                                           | No (pero puede usar `screen`/`tmux` para eso)                  |
| **Paneles (splits)**      | Sí – dividir la ventana en paneles horizontales/verticales                    | No                                                                                      | No                                                             |
| **Persistencia**          | Sí – sesiones pueden permanecer después de cerrar el cliente                  | No (el estado del shell desaparece al cerrar)                                           | No (el estado del shell desaparece al cerrar)                  |
| **Configuración**         | Archivo `~/.tmux.conf`; opciones en tiempo real con `tmux set-option`         | Archivo `~/.zshrc`; gran ecosistema de frameworks (Oh‑My‑Zsh, Prezto)                   | Archivo `~/.bashrc` o `~/.bash_profile`                        |
| **Completado automático** | Limitado (solo para comandos de tmux)                                         | Muy avanzado, soporta menús y descripciones                                             | Básico, pero ampliable con `bash-completion`                   |
| **Globbing y expansión**  | Hereda del shell subyacente                                                   | Extendido (por ejemplo, `**` recursivo)                                                 | Estándar POSIX                                                 |
| **Plugins/extensiones**   | Plugins vía TPM (Tmux Plugin Manager)                                         | Amplio ecosistema de plugins (Oh‑My‑Zsh, etc.)                                          | Menos comunes; se usan scripts externos                        |
| **Historial compartido**  | Sí – historial accesible entre paneles y sesiones                             | No (historial por instancia)                                                            | No (historial por instancia)                                   |
| **Soporte de scripting**  | Comandos de control (`new-session`, `split-window`, etc.)                     | Scripts de shell completos                                                              | Scripts de shell completos                                     |
| **Portabilidad**          | Disponible en Linux, macOS, BSD, Windows (WSL/Cygwin)                         | Disponible en Linux, macOS, BSD, Windows (WSL)                                          | Disponible en prácticamente todos los sistemas Unix‑like       |
| **Curva de aprendizaje**  | Media – requiere aprender prefijos y comandos de gestión                      | Media – muchas opciones y sintaxis avanzada                                             | Baja a media – familiar para usuarios POSIX                    |
| **Uso típico**            | Desarrollo, administración remota, trabajo con múltiples procesos simultáneos | Personalización del prompt, autocompletar, manejo de historial                          | Scripts de inicio, automatización, uso general                 |

## Instalacion y uso tmux

para instalar:

- `sudo apt-get install tmux`
- `sudo dnf tmux`
- `sudo pacman -S tmux`

para correrlo, la opcion recomendada es:
`tmux new -s <nombre que le daras a la sesion>`
o otra opcion es:
`tmux`

tmux de que te sirve?

Sirve para centralizar las ventanas de terminal, en una sola terminal.

Los atajos para utilizar tmux, son:

| Modo                                 | Tecla(s)                                                      | Acción                                                         |
| ------------------------------------ | ------------------------------------------------------------- | -------------------------------------------------------------- |
| **Prefijo**                          | `Ctrl‑b`                                                      | Inicia la secuencia de comandos de tmux (prefijo por defecto). |
| **Dividir panel vertical**           | `Ctrl‑b "`                                                    | Divide la ventana actual en dos paneles horizontales.          |
| **Dividir panel horizontal**         | `Ctrl‑b %`                                                    | Divide la ventana actual en dos paneles verticales.            |
| **Navegar entre paneles**            | `Ctrl‑b ← ↑ → ↓` o `Ctrl‑b h j k l`                           | Cambia el foco al panel adyacente correspondiente.             |
| **Redimensionar panel**              | `Ctrl‑b Alt‑← ↑ → ↓` o `Ctrl‑b : resize-pane -L/-U/-R/-D <n>` | Ajusta el tamaño del panel activo.                             |
| **Crear nueva ventana**              | `Ctrl‑b c`                                                    | Crea una nueva ventana dentro de la sesión.                    |
| **Cambiar de ventana**               | `Ctrl‑b n` / `Ctrl‑b p`                                       | Navega a la siguiente (`n`) o anterior (`p`) ventana.          |
| **Seleccionar ventana por número**   | `Ctrl‑b 0‑9`                                                  | Salta directamente a la ventana numerada.                      |
| **Renombrar ventana**                | `Ctrl‑b ,`                                                    | Permite cambiar el nombre de la ventana actual.                |
| **Listar ventanas**                  | `Ctrl‑b w`                                                    | Muestra una lista interactiva de todas las ventanas.           |
| **Cerrar panel**                     | `Ctrl‑b x`                                                    | Cierra el panel activo después de confirmar.                   |
| **Cerrar ventana**                   | `Ctrl‑b &`                                                    | Elimina la ventana actual después de confirmar.                |
| **Copiar modo**                      | `Ctrl‑b [`                                                    | Entra al modo de copia para seleccionar y copiar texto.        |
| **Pegar**                            | `Ctrl‑b ]`                                                    | Pega el contenido copiado previamente.                         |
| **Buscar texto**                     | `Ctrl‑b /`                                                    | Busca una cadena dentro del historial del panel.               |
| **Desactivar prefijo temporalmente** | `Ctrl‑b : set -g prefix None`                                 | Desactiva el prefijo (útil para scripts).                      |
| **Re cargar configuración**          | `Ctrl‑b : source-file ~/.tmux.conf`                           | Recarga el archivo de configuración sin reiniciar tmux.        |
| **Mostrar ayuda**                    | `Ctrl‑b ?`                                                    | Muestra la lista completa de atajos disponibles.               |
