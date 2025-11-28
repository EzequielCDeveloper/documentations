## Add keyrings configurations

- `sudo apt-get update`
- `apt-get install ca-certificates curl`
- `sudo install -m 0755 -d /etc/apt/keyrings`
- `sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc`
- `sudo chmod a+r /etc/apt/keyrings/docker.asc`

## Add the repository to Apt sources

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
```

- `sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
- `sudo apt-get update`
- `sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

## check docker

- `docker run --itd --name c1 -p 8081:80 nginx #this is for make a ngix server`
- `docker run --itd --name c2 -p 8082:80 httpd:2.4 #this is for make a apache server`
  > c1 is the name of the container, you can put other name or other port
- `docker container ls`
- `docker logs c1 #chech logs`
- `docker stop c1 #stop container`
- `docker rm c1 #delete container`
- `docker compose version`
- `docker --help #Show you a lot of commands for use.`

## WordPress Setup

- `mkdir wordpress`
- `cd wordpress`
- `nano docker-compose.yml`
  In the file, paste the next code:

```yml
services:
  db:
    # We use MySQL 5.7 or 8.0, or MariaDB (often preferred for Debian)
    image: mysql:8.0
    container_name: wp_database
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: strong_root_password
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wp_user
      MYSQL_PASSWORD: strong_db_password
    volumes:
      - db_data:/var/lib/mysql

  wordpress:
    image: wordpress:latest
    container_name: wp_site
    restart: always
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wp_user
      WORDPRESS_DB_PASSWORD: strong_db_password
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wp_data:/var/www/html
    depends_on:
      - db

volumes:
  db_data:
  wp_data:
```

> **IMPORTANT:**
> Change _strong_root_password_ and _strong_db_password_ to secure passwords of your choice.
>
> To launch the container:

- `docker compose up -d`

## Verify

1. Open youir web browser
2. navigate to `http://<your-server>`
