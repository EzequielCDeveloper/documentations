## Introduction

Docker is an container manangment.

Virtual machine: apart of the principal OS, replicate hardware, Run Operating system, aplications, dependencies and process.

Container: Apart of the principal OS,take the kernel of the actual OS and Run aplications, dependencies and process.

# Installation of Docker

## Arch linux

exist docker native and docker-desktop. I'm not recommend use docker-desktop, because, yes have a interface,
but the mode of run is running a VM with a linux inside. So, why you wanna that if you're ready using linux.

Much better terminal:)

### Set up KVM for docker desktop

_Docker desktop runs a VM that requires KVM_

- `sudo modprobe kvm`
  How to check?
  Depending on the processor of the host machine, the corresponding module must be loaded:

- `sudo modprobe kvm_intel #Intel processors`
- `sudo modprobe kvm_amd #AMD processors`
  To chech if the KVM modules are enabled, run:
- `lsmod | grep kvm`

#### Set up KVM user permission by adding your user to the KVM group in order to access the KVM device

- `sudo usermod -aG kvm $USER`
  use kvm user group on the system:
- `newgrp kvm`

---

The docker service may fail if you have and VPN, you can try to start the service without VPN and after, activated the VPN.

- $ `docker run -it --rm archlinux bash -c "echo hello world"`

To install docker desktop experimental:

> $ `wget https://download.docker.com/linux/static/stable/x86_64/docker-29.0.4.tgz -qO- | tar xvfz - docker/docker --strip-components=1`
>
> $ `sudo cp -rp ./docker /usr/local/bin/ && rm -r ./docker`
>
> $ `sudo pacman -U ./docker-desktop-x86_64.pkg.tar.zst`

you can launch the app via gui or terminal with:

- `sudo systemctl --user enable docker-desktop`
- `sudo systemctl --user start docker-desktop`

### To install docker engine Arch

- `sudo pacman -S docker`
- `sudo systemctl start docker.service`
- `sudo systemctl enable docker.service #for run docker when the enviroment boot`
- `sudo usermod -aG docker $(whoami)`
- `newgrp docker`
- `docker run hello-world`

## Debian docker engine

The next script you have the run in root, is an automatization for install and setup docker

- `curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh`
