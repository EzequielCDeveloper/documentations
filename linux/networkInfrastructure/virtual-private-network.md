# Virtual Private Network

[Click here to read the official documentation OpenVPN on Debian](https://wiki.debian.org/OpenVPN)

## Introduction

A Virtual Private Network (VPN) is a way to link two different local Networks through the internet by way of a tunnel is usually encrypted for confidentiality. VPN's are often used to integrate a remote machine within a company's local Network.

OpenVPN is an efficient solution, easy to deploy and maintain, based on SSL/TLS. Another possibility is using IPsec to encrypt IP traffic between two machines; this encryption is transparent, which means that aplications running on these hosts need not be modified to take the VPN into account. SSH can also be used to provide VPN, in addition to its more conventional features. Finally, other solution can be using Microsoft's PPTP protocol.

## OpenVPN

OpenVPN is a piece of software dedicated to creating virtual private Networks. Its seup involves creating virtual Networks interfaces on the VPN server and on the client(s); both tun (for IP-level tunnels) and tap (for Ethernel-level tunnels) interfaces are supported. In practice, tun jinterfaces will most often be used except when the VPN clients are meant to be integrated into the server's local Network by way of an Ethernet bridge.

OpenVPN relies on OpenSSL for all the SSL/TLS cryptography and associated features (confidentiality, authentication, integrity, non-repudiation). It can be configured either with a shared private key or using X.509 ceritificates based on a public key infraestructure. The latter configuration is strongly preferred since it allows greater flexibility when faced with a growing number of roaming users accessing the VPN.

[click here for steps to installation](https://wiki.debian.org/OpenVPN#Installation)

## Virtual Private Network with SSH

![network diagram](/assets/networkDiagram-vpn.webp)
The second method is more recent, and was introduced with OpenSSH 4.3; it is now possible for OpenSSH to create virtual network interfaces (tun\*) on both sides of an SSH connection, and these virtual interfaces can be configured exactly as if they were physical interfaces. The tunneling system must first be enabled by setting PermitTunnel to “yes” in the SSH server configuration file (/etc/ssh/sshd_config). When establishing the SSH connection, the creation of a tunnel must be explicitly requested with the -w any:any option (any can be replaced with the desired tun device number). This requires the user to have administrator privilege on both sides, so as to be able to create the network device (in other words, the connection must be established as root).

[click here for steps to installation](https://std.rocks/vpn_ssh.html)
