se escuentra entre los directorios ocultos del usuario, para listar dichos directorios:

`ls -la`

.zshrc y .bashrc

estos archivos, son los de configuracion de la terminal que tengas. En este archivo es posible realizar renombramientos, abreviaturas u crear funciones en bash para realizar x cosa.

ejemplo de funcion:

```bash
function verMiIp() {
  echo "Tu IP privada es: $(hostname -I | awk '{print $1}')"
}
```

dicha funcion la agregas al archivo de la terminal que te encuentras usando, ejemplo:
`nvim .zshrc`
y dentro agregas el codigo de la funcion verMiIp.

---

Con lo anterior hecho, ahora estando en una nueva terminal, escribes verMiIp y boom. Tu primera funcion guardada en tu archivo de configuracion de terminal.

REFERENCIAS:
[Que es bashrc en linux?](https://www.compuhoy.com/que-es-bashrc-en-linux/)
[Porque deberias usar ZSH?](https://respontodo.com/que-es-zsh-y-por-que-deberia-usarlo-en-lugar-de-bash/)
