Crear archivo:
`touch script.sh`

`nvim script.sh`

```bash
#!/bin/bash

greencolor="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34\033[1m"
yellowColour="\e[0;35m\033[1m"
purpleColour="\e[0;35m\033[1m"
turqueoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37\033[1m"

echo -e "\n${yellowColour}[+]${endColour} ${blueColour}Esta es tu direccion IP privada ->${endColour}${redColour} $(ip a | grep ens33 | tail -n 1 | awk '{print $1}' FS="/")${endColour}\n"
```

Con esto al ejecutar el archivo, se mirara el script con coleres. Esto puede resultar util para la visualizacion de la informacion del script.

para ejecutar el script, podemos darle permisos de ejecucion:

`chmod + x && /.script`

o ejecutarlo con bash.

`bash /.script`
