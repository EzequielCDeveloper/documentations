## Introduction

Docker is an container manangment.

Virtual machine: apart of the principal OS, replicate hardware, Run Operating system, aplications, dependencies and process.

Container: Apart of the principal OS,take the kernel of the actual OS and Run aplications, dependencies and process.

# Installation of Docker

## Arch linux

- To install docker cli:
  `sudo pacman -S docker`

The docker service may fail if you have and VPN, you can try to start the service without VPN and after, activated the VPN.

- $ `docker run -it --rm archlinux bash -c "echo hello world"`

To install docker desktop experimental:

> $ `wget https://download.docker.com/linux/static/stable/x86_64/docker-29.0.4.tgz -qO- | tar xvfz - docker/docker --strip-components=1`
>
> $ `sudo cp -rp ./docker /usr/local/bin/ && rm -r ./docker`
>
> $ `sudo pacman -U ./docker-desktop-x86_64.pkg.tar.zst`

you can launch the app via gui or terminal with:
`systemctl --user start docker-desktop`

## Debian

To install docker desktop, you can search in the docker web to donwload the .deb of docker desktop.
