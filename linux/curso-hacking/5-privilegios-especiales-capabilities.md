privilegios de capacidad que se le puede brindar al binario de alguna aplicacion.

```bash
which python3.9 | xargs ls -l
-rwxr-xr-x 1 root

Python3.9.2
>>> import os
>>> os.setuid(0)
>>> os.system("whoami")
root
0
```

`which getcap #permite listar las capabilities del sistema`

ejemplo:
`getcap -r / 2>/dev/null`

## REFERENCIAS

[Que son las capabilities?](http://www.etl.it.uc3m.es/Linux_Capabilities)
