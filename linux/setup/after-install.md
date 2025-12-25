## Verify internet

The ping, is an protocol of communication. You sent a package to a host and expecting he return it another package.

- `ping -c 3 google.com`

How to find your interface name?

- `ip link`
  You will see lo (loopback) and another one like eth0, enp3s0, or eno1. Let's assume it is enp3s0 for the examples below.

If in down, you can turn on with:

- `ip link set enp3s0 up`
  if permission denied, you need to execute the command as user root.

Error with an OUTPUT: `RTNETLINK answers: Operation not possible due to RF-kill`

> rfkill is a kernel interface that lets you enable or disable radio devices (Wi‑Fi, Bluetooth, WWAN, GPS, etc.).
> The state is stored in the kernel; it survives a reboot only if a service or script restores it.

There's also the lovely solving of the rfkill (almost) Catch-22:

    Wi-Fi isn't working

    need* rfkill to check/correct that (or so one believes)

    don't have other networking or other (at least presently reasonable) means to get the rfkill program (package containing it) onto the host

    need the Wi-Fi working to get that and other software

\*well, almost need, the solution:

Here's your first hint:

`find /proc/[!0-9]* /sys -name '*rfkill*' -print`

So, e.g., a Debian host under my fingertips (on bare metal) ...

with the hardware physical switch off/disabled:

`grep . /sys/class/rfkill/rfkill*/{hard,soft} | sort`

> /sys/class/rfkill/rfkill0/hard:1
> /sys/class/rfkill/rfkill0/soft:1
> /sys/class/rfkill/rfkill1/hard:1
> /sys/class/rfkill/rfkill1/soft:1
> /sys/class/rfkill/rfkill2/hard:1
> /sys/class/rfkill/rfkill2/soft:1

after flipping the hardware switch on:
`grep . /sys/class/rfkill/rfkill*/{hard,soft} | sort`

> /sys/class/rfkill/rfkill0/hard:1
> /sys/class/rfkill/rfkill0/soft:1
> /sys/class/rfkill/rfkill1/hard:0
> /sys/class/rfkill/rfkill1/soft:1
> /sys/class/rfkill/rfkill2/hard:0
> /sys/class/rfkill/rfkill2/soft:1

and software enabling:
`echo 0 | tee /sys/class/rfkill/rfkill[012]/soft >>/dev/null`

`grep . /sys/class/rfkill/rfkill*/{hard,soft} | sort`

> /sys/class/rfkill/rfkill0/hard:0
> /sys/class/rfkill/rfkill0/soft:0
> /sys/class/rfkill/rfkill1/hard:0
> /sys/class/rfkill/rfkill1/soft:0
> /sys/class/rfkill/rfkill2/hard:0
> /sys/class/rfkill/rfkill2/soft:0
> /sys/class/rfkill/rfkill5/hard:0
> /sys/class/rfkill/rfkill5/soft:0

And since I actually have the rfkill command, can use that to inspect:

`rfkill`

> ID TYPE DEVICE SOFT HARD
> 0 wlan phy0 unblocked unblocked
> 1 wlan dell-wifi unblocked unblocked
> 2 bluetooth dell-bluetooth unblocked unblocked
> 5 bluetooth hci0 unblocked unblocked

but who needs rfkill to change that?

`echo 1 | tee /sys/class/rfkill/rfkill[012]/soft >>/dev/null`

`grep . /sys/class/rfkill/rfkill*/{hard,soft} | sort && rfkill`

> /sys/class/rfkill/rfkill0/hard:1
> /sys/class/rfkill/rfkill0/soft:1
> /sys/class/rfkill/rfkill1/hard:0
> /sys/class/rfkill/rfkill1/soft:1
> /sys/class/rfkill/rfkill2/hard:0
> /sys/class/rfkill/rfkill2/soft:1
> ID TYPE DEVICE SOFT HARD
> 0 wlan phy0 blocked blocked
> 1 wlan dell-wifi blocked unblocked
> 2 bluetooth dell-bluetooth blocked unblocked

`echo 0 | tee /sys/class/rfkill/rfkill[012]/soft >>/dev/null`

`grep . /sys/class/rfkill/rfkill*/{hard,soft} | sort && rfkill`

> /sys/class/rfkill/rfkill0/hard:0
> /sys/class/rfkill/rfkill0/soft:0
> /sys/class/rfkill/rfkill1/hard:0
> /sys/class/rfkill/rfkill1/soft:0
> /sys/class/rfkill/rfkill2/hard:0
> /sys/class/rfkill/rfkill2/soft:0
> ID TYPE DEVICE SOFT HARD
> 0 wlan phy0 unblocked unblocked
> 1 wlan dell-wifi unblocked unblocked
> 2 bluetooth dell-bluetooth unblocked unblocked

So, don't need the rfkill command to do the soft unblock/block nor to check the status of hard or soft unblock/block state.

## Install and configurated sudo

For default, debian not have sudo.
You have to install them, for this you have to stay as root user:

- `su -`
  With this command you enter to root (enter password of root user)
- `apt update && apt install sudo -y`
  After installation you have to add your user to the list user for root:
- `usermod -aG sudo your_username`
- `exit`
  For aply the changes, you most to log out and log back. (or close the connection of ssh)

## Installation of additional software

### Arch Linux

1. `sudo pacman -S duf #View space in disk of files` -> command: `duf`
2. `sudo pacman -S skim #browser of files route` -> command: `sk`
3. `sudo pacman -S broot #file explorer for terminal with integration with git`
   > command: `broot`
   > or
   > command: `broot -spd`
4. `sudo pacman -S calcurse #calendar and task manager for terminal`
5. `sudo pacman -S thefuck`
   add to .bashrc or .zshrc, the line:
   `eval "$(thefuck --alias)"`

> after do an error, write `fuck` and the tool say you how to write correctly the command

6. `sudo pacman -S lf #list file, explorer manager more light than broot`
7. `sudo pacman -S glances #better option to htop`

### Debian

1. `sudo apt-get install glances #for view the system in live`
2. `sudo apt-get install ranger #file manager for terminal`
3. `sudo apt-get install zoxide #for move beetwen files and folder`
4. `sudo apt-get install lsd #for view better the files`
5. `sudo apt-get install batcat #for view better the content of a file`
6. `sudo apt-get install pacdoc #convert of many types of  formats (40)`

> example of use:
> `pacdoc pruebas.odt -o prueba.html`
> `pandoc prueba.md -o prueba.html`

7. `sudo apt-get install duf # View space in disk of files`

8. `sudo apt-get install nala # other intarface for apt, more legible, recommended for personal use,not to server.`

9. `sudo apt-get install calcurse #calendar and task manager for terminal`
10. `sudo apt-get install asciinema #record terminal in format .cast`
    > to start record, command: `asciinema rec`
    > to stop record, command: `exit` or _ctrl_ + _d_
    > to play local the record, command: `asciinema play <route to record>`
    > to upload to cloud the record, command: `asciinema upload <route to record>`
