# INFRAESTRUCTURA HOMELAB: RASPBERRY PI 3 B+ & DEBIAN X86

# Método: Docker Compose (Infraestructura como Código)

## 1. PRE-REQUISITOS DEL SISTEMA (Ejecutar en Host)

# No importa si es Pi o PC, esto prepara el terreno.

# Actualizar y limpiar

sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git

# Instalar Docker & Docker Compose (Script oficial, detecta arquitectura auto)

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# (Debes cerrar sesión y volver a entrar para que aplique el grupo docker)

# PREPARACIÓN DE DIRECTORIOS (Persistencia de datos)

mkdir -p ~/homelab/{traefik,gitea,pihole,unbound,vaultwarden,uptime-kuma,syncthing,mosquitto,redis}
touch ~/homelab/traefik/acme.json && chmod 600 ~/homelab/traefik/acme.json
touch ~/homelab/traefik/traefik.yml

## 2. SÍNTESIS DE SERVICIOS

| Servicio        | Función Princ. | Valor Educativo (Por qué instalarlo)               |
| --------------- | -------------- | -------------------------------------------------- |
| **Traefik**     | Reverse Proxy  | Routing dinámico, SSL/TLS, Docker events.          |
| **Gitea**       | Git Server     | CI/CD, gestión SSH, arquitectura Go.               |
| **Syncthing**   | Sync P2P       | Sistemas distribuidos, independencia de nube.      |
| **Pi-hole**     | DNS Sinkhole   | Networking, DHCP, filtrado de tráfico.             |
| **Unbound**     | Recursive DNS  | DNS real, privacidad total, caching.               |
| **Vaultwarden** | Password Mgr   | Cifrado cliente-servidor, seguridad Rust.          |
| **Uptime Kuma** | Monitorización | SLAs, latencia, protocolos HTTP/TCP.               |
| **WireGuard**   | VPN            | Tunelización segura, criptografía moderna.         |
| **Mosquitto**   | MQTT Broker    | Arquitectura asíncrona, IoT, Pub/Sub.              |
| **Redis**       | DB In-Memory   | Caching, colas, gestión de memoria.                |
| **Watchtower**  | Auto-Updater   | Automatización de mantenimiento (Cuidado en Prod). |

## 3. DOCKER COMPOSE MAESTRO (docker-compose.yml)

# Crea un archivo `docker-compose.yml` en `~/homelab/` y pega esto.

version: "3.8"

services:

# --- CORE: PROXY INVERSO ---

traefik:
image: traefik:v2.10
container_name: traefik
command: - "--api.insecure=true" # Solo para dev/home local - "--providers.docker=true" - "--providers.docker.exposedbydefault=false" - "--entrypoints.web.address=:80"
ports: - "80:80" - "8080:8080" # Dashboard
volumes: - /var/run/docker.sock:/var/run/docker.sock:ro - ./traefik/traefik.yml:/etc/traefik/traefik.yml
restart: unless-stopped

# --- DEV: CÓDIGO ---

gitea:
image: gitea/gitea:latest
container_name: gitea
environment: - USER_UID=1000 - USER_GID=1000
volumes: - ./gitea:/data - /etc/timezone:/etc/timezone:ro - /etc/localtime:/etc/localtime:ro
ports: - "3000:3000" - "2222:22" # Passthrough SSH
restart: unless-stopped

# --- RED: DNS & BLOQUEO ---

pihole:
image: pihole/pihole:latest
container_name: pihole
environment: - TZ=America/Mexico_City # Ajusta tu zona - WEBPASSWORD=admin # CAMBIA ESTO
volumes: - ./pihole/etc-pihole:/etc/pihole - ./pihole/etc-dnsmasq.d:/etc/dnsmasq.d
ports: - "53:53/tcp" - "53:53/udp" # Puerto Web mapeado a otro para no chocar con Traefik si lo integras luego - "8081:80"
restart: unless-stopped # Nota: En Ubuntu/Debian x86, debes desactivar systemd-resolved antes # o el puerto 53 dará error.

# --- DATOS: SINCRONIZACIÓN ---

syncthing:
image: syncthing/syncthing
container_name: syncthing
environment: - PUID=1000 - PGID=1000
volumes: - ./syncthing:/var/syncthing
ports: - "8384:8384" # Web UI - "22000:22000/tcp" # Sync traffic - "22000:22000/udp" - "21027:21027/udp" # Discovery
restart: unless-stopped

# --- SEGURIDAD: CONTRASEÑAS ---

vaultwarden:
image: vaultwarden/server:latest
container_name: vaultwarden
volumes: - ./vaultwarden:/data
ports: - "8082:80" # Requiere HTTPS para funcionar bien (usar vía Traefik idealmente)
restart: unless-stopped

# --- OBSERVABILIDAD ---

uptime-kuma:
image: louislam/uptime-kuma:1
container_name: uptime-kuma
volumes: - ./uptime-kuma:/app/data
ports: - "3001:3001"
restart: unless-stopped

# --- MENSAJERÍA ASÍNCRONA ---

mosquitto:
image: eclipse-mosquitto
container_name: mosquitto
volumes: - ./mosquitto/config:/mosquitto/config - ./mosquitto/data:/mosquitto/data - ./mosquitto/log:/mosquitto/log
ports: - "1883:1883" - "9001:9001"
restart: unless-stopped

# --- BASE DE DATOS CACHÉ ---

redis:
image: redis:alpine
container_name: redis
command: redis-server --maxmemory 100mb --maxmemory-policy allkeys-lru
volumes: - ./redis:/data
restart: unless-stopped

## 4. COMANDO DE DESPLIEGUE FINAL

# Una vez creado el archivo, ejecuta:

# docker compose up -d

# Para ver logs:

# docker compose logs -f [nombre_servicio]
