# SSH or Secure Shell

Is a cryptographic network protocol that allows establishing a secure channel between a local and remote computer. It is widely used for administering Linux servers remotely over an encrypted connection.

## 1. Installation

`sudo apt-get update`  
Install the package
`sudo apt-get install openssh-server`

You'll see output like this:

```bash
Reading package lists... Done
Building dependency tree... Done
The following additional packages will be installed:
  openssh-client
Suggested packages:
  ssh-askpass
The following NEW packages will be installed:
  openssh-client openssh-server
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 255 kB of archives.
After this operation, 925 kB of additional disk space will be used.
Do you want to continue? [Y/n]
```

Type Y and hit enter to confirm installation.

The openSSH server and client packages will be installed on your system.

## 2. chech status of SSH server

`sudo systemctl status sshd`

## 3. Manage the SSH Server service

The sshd can be controlled just like any other systemd service on Debian.

To start if it is stopped:
`sudo systemctl start sshd`

To stop the service:
`sudo systemctl stop sshd`

To automatically start sshd on boot:
`sudo systemctl enable sshd`

Or disable from starting on boot:
`sudo systemctl disable sshd`

## 4. Connect to the SSH Server Remotely

Find your server IP Address. On the server run:
`hostname -i`

> For the example we assume the output was 192.168.1.2

On the client machine, connect to the server using ssh:
`ssh your_username_server@192.168.1.2`
If this ir your firts time connecting, you'll a warning like:

```bash
The authenticity of host ‘192.0.2.10‘ cannot be established.
RSA key fingerprint is SHA256:NdER9h7C3u8AJCEYxk5KxUg.
Are you sure you want to continue connecting (yes/no)?
```

type yes.

## 5. Configure SSH Server Options

The main SSH server configuration file is located at /etc/ssh/sshd_config
Some common options to modify:

- **Port**: change this to use a non-standard port like 2222 for greater security.
- **ListenAddress**: Restrict the IP/interface sshd listens on, for example ListenAddress 192.0.2.10
- **AllowUser**: List of authorized usernames allowed to log in.
- **Authentication**: Enable public key Authentication, and disable password login.

After editing sshd_config, restart the service to apply the changes:  
`sudo systemctl restart sshd`

## 6. Set Up Public Key Authentication

Using SSH public key Authentication instead of password provides stronger security.

On your client machine, generate an SSH keypair:
`ssh-keygen -t rsa`
Accept the default location, and enter a passphrase when prompted.

This generates an SSH keypair - a private key (ip_rsa) and public key (id_rsa.pub) in **_~/.ssh/_**

On the Debian SSH server, edit `~/.ssh/authorized_keys` and append your public key:

`nvim ~/..ssh/authorized_keys`

`ssh-rsa AAAAF.....YOUR-PUBLIC-KEY.... user@client`

Save the file. The public key allows your client machine to authenticate without entering a password.

You can also disable password Authentication in sshd_config by setting **PasswordAuthentication no** and restart sshd.

## 7. SSH Port Forwading Examples

SSH port Forwading allows tunneling application traffic from your local machine to the remote server - this traffic is encrypted through the SSH tunnel.
_Local Forwading_ tunnels connections from the SSH client to the server:

`ssh -L 8080:localhost:80 server_ip`

This forwards local port 8080 to port 80 on the remote server.

You can connect to localhost:8080 on your client, and the connection is forwaded securely to the server.

**Reverse forwading** tunnels connections from the server back to the client:

`ssh -R 8080: localhost:3000 server_ip`

This tunnels the serve's port 8080 to the client's port 3000

Port forwading is very useful for accessing services on remote networks.

## 8. Troubleshooting SSH connections

If you are having trouble connecting to the SSH server, try these steps:

- On the server, check if sshd is running using systemctl status ssh. Start it if stopped.
- Verify the server‘s firewall allows connections on the SSH port. Debian‘s default firewall is ufw – check it‘s status with sudo ufw status.
- Try connecting from the server to itself using ssh localhost. This tests that sshd is working locally.
- Check /var/log/auth.log on the server for any failed connection messages or errors.
- Ensure your local client accepts and stores new server keys in ~/.ssh/known_hosts.
- For a more verbose ssh output, run ssh -vv server_ip to diagnose any issues.

## 9. Best Practices for securing SSH

Here are some tips for keeping your SSH server secure:

- Use public/private keys instead of password authentication
- Disable root login via SSH and use sudo privileges instead
- Whitelist only the allowable source IP ranges in sshd_config
- Change the default SSH port from 22 to a non-standard one
- Use firewall rules to only allow SSH connections from specific IPs
- Monitor auth logs on the server for failed login attempts
- Use tools like fail2ban to automatically block brute force attacks
- Disable unused SSH features like agent forwarding, X11 forwarding etc.
- Upgrade to the latest SSH version on your server for security patches

Following these best practices will help prevent unauthorized access and keep your SSH server access locked down.
