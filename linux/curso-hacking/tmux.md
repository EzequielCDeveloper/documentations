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
