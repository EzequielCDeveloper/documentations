## Verify internet

The ping, is an protocol of communication. You sent a package to a host and expecting he return it another package.

- `ping -c 3 google.com`

How to find your interface name?

- `ip link`
  You will see lo (loopback) and another one like eth0, enp3s0, or eno1. Let's assume it is enp3s0 for the examples below.

If in down, you can turn on with:

- `ip link set enp3s0 up`

## Install and configurated sudo

For default, debian not have sudo.
You have to install them, for this you have to stay as root user:

- `sudo -`
  With this command you enter to root (enter password of root user)
- `apt update && apt install sudo -y`
  After installation you have to add your user to the list user for root:
- `usermod -aG sudo your_username`
- `exit`
  For aply the changes, you most to log out and log back. (or close the connection of ssh)

## Installation additional software
