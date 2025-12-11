## Comparacion de terminales

| Característica               | tmux (multiplexor)                                                 | GNOME Terminal                                    | Konsole (KDE)                                    | Tilix (terminal tiling)                                                                 | Alacritty (GPU‑accelerated)                                 |
| ---------------------------- | ------------------------------------------------------------------ | ------------------------------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Tipo**                     | Multiplexor de terminal                                            | Emulador de terminal                              | Emulador de terminal                             | Emulador de terminal con soporte de tiling                                              | Emulador de terminal ultra‑rápido                           |
| **Objetivo principal**       | Gestionar múltiples sesiones/paneles en una única ventana          | Proveer una terminal estándar para entornos GNOME | Proveer una terminal integrada en el entorno KDE | Ofrecer terminales divididos en mosaico dentro de una sola ventana                      | Renderizado rápido usando GPU, mínima latencia              |
| **División de paneles**      | Sí (horizontal y vertical) mediante atajos `Ctrl‑b "` y `Ctrl‑b %` | No (requiere abrir nuevas pestañas)               | No (pestañas, no paneles)                        | Sí (arrastrar‑y‑soltar, atajos `Ctrl‑Shift‑E`/`Ctrl‑Shift‑O`)                           | No (solo pestañas)                                          |
| **Gestión de sesiones**      | Sí – sesiones persistentes aunque el cliente se cierre             | No (las pestañas se pierden al cerrar)            | No (pestañas locales)                            | No (pestañas locales)                                                                   | No (pestañas locales)                                       |
| **Persistencia**             | Sí – sesiones pueden mantenerse en segundo plano                   | No                                                | No                                               | No                                                                                      | No                                                          |
| **Atajos de teclado**        | Prefijo configurable (`Ctrl‑b` por defecto)                        | Atajos GNOME estándar (`Ctrl‑Shift‑T`, etc.)      | Atajos KDE (`Ctrl‑Shift‑N`, etc.)                | Atajos personalizados, compatibles con tmux (`Ctrl‑Shift‑Space` para modo de selección) | Atajos minimalistas, configurables en `alacritty.yml`       |
| **Configuración**            | Archivo `~/.tmux.conf`; opciones en tiempo real                    | GUI + dconf (`org.gnome.Terminal`)                | GUI + archivo `konsolerc`                        | Archivo `~/.config/tilix/config` (JSON)                                                 | Archivo `~/.config/alacritty/alacritty.yml` (YAML)          |
| **Extensibilidad / Plugins** | TPM (Tmux Plugin Manager) y scripts externos                       | Extensiones GNOME Shell, pero limitadas           | Scripts y esquemas de color KDE                  | Plugins via `tilix --plugin` (poco comunes)                                             | Ninguno oficial; depende de la configuración YAML           |
| **Renderizado**              | Texto puro (CPU)                                                   | VTE (GTK)                                         | KWin + VTE                                       | VTE (GTK)                                                                               | OpenGL (GPU)                                                |
| **Soporte de GPU**           | No                                                                 | No                                                | No                                               | No                                                                                      | Sí – acelera el dibujo de texto y gráficos                  |
| **Portabilidad**             | Linux, macOS, BSD, Windows (WSL/Cygwin)                            | Linux (GNOME)                                     | Linux (KDE)                                      | Linux (GTK)                                                                             | Linux, macOS, Windows (WSL)                                 |
| **Curva de aprendizaje**     | Media – requiere aprender prefijo y comandos                       | Baja – interfaz gráfica familiar                  | Baja – similar a GNOME Terminal                  | Media – manejo de tiling y atajos avanzados                                             | Baja – configuración basada en YAML                         |
| **Uso típico**               | Desarrollo remoto, multitarea, sesiones persistentes               | Uso diario, ejecución de comandos simples         | Entorno KDE, integración con otras apps KDE      | Usuarios que desean dividir pantalla sin usar tmux                                      | Usuarios que priorizan velocidad y bajo consumo de recursos |

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
