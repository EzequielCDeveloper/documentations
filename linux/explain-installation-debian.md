# Debian installation

---

**_The best option is a minimal installation._**

## language and location

The information about language and location, is for programs offer the most appropiate keyboard layout.
This will also influence the configuration of the time zone.

## keyboard layout

American English keyboard correspond to the usual QWERTY layout.

## Detecting hardware

> Automatic process
> The installer detects your hardware, tries to identify the CD-ROM drive.

## Loading Components

The installer loads all the files necessary to continue with its work. This include drives for the remaining hardware

## Detecting Network hardware

This is an Automatic step, where the script tries to identify the Network.

## Configuring the Network

In order to automate the process as much as possible, the installer attempts an automatic Network configuration by DHCP

### TIP configuration without DHCP

> If local Network have his own DHCP server
>
> - you prefer to define a static IP address for the machine during the installation.
> - netcfg/use*dhcp=false option when booting from the installation media.
>   You just need to go to the desired menu entry by pressing the TAB key and add the desired option before pressing \_Enter*

### BEWARE Do not improvise

Exist some configuration of red where are based on an implicit assumption that all machines can be trusted,
and inadequate configuration of a single computer will often perturb the whole Network.

> In other words:
> \*\*Your machine, do not connected to a Network without firts,
> agreeing with its administrator on the appropiate settings.

## administrator password

_Super root user is created automatically during installation._

- A password is requested for this user.
  PRESS WITH EMPTY PASSWORD:
  You can do it if you wanna to disable root user.

  ### SECURITY Administrator password

  > The root user's password should be long (12 characters or more)
  >
  > The normal force attacks use dicionarys of passwords, so your password, would not be normal.

## Creating the first User

Debian force to create a user, for not have the bad habit of working with the root user.

## Configuring the clock

If the network is available, the system's internal clock is updated from NTP server.

## Starting the partitioning tool

This step automatically detects the hard drives on which debian may be installed.

## Starting the partitioning tool

> GUI tool:
> for default linux has guided mode with possible recommends partitions for the user to make - most cases.
>
> - GUIDED - use entire disk: For a new user this is the easy way.
> - GUIDED - use entire disk and set up LVM: Logical voluemes instead of partitions.

---

## Partition for SERVERS

> **_BEST FOR SERVERS:_**
> "Separate _/home_, _/var_, and _/tmp_ partitions."

Is appropriate for servers and multi-user systems. It divides the file tree into many partitions:
In addition to the root (/) and user accounts (/home/) partitions, it also has partitions for server software data (/var/),
and temporary file (/tmp/).
These divisions have several advantages. Users can not lock up the server by consuming all available hard drive space
(they can only fill up /tmp/ and /home/). The daemon data (especially logs) can no longer clog up the rest of the system.

> _BACK TO BASICS Choosing a filesystem:_
>
> A filesystem defines the way in which data is organized on the hard drive. Each existing filesystem has its  
> merits and limitations. Some aremore robust, others more effective: if you know your needs well, choosing the most appropiate  
> filesystem is possible. Various comparisons have already been made;
>
> - _ReiserFS_, is particularly effiecient for reading many small files.
> - _XFS_, in turn, works faster with large files.
> - _Ext4_, the default filesystem historically used in Linux. Overcomes certain limitations, is particularly appropiate for very
>   large capacity hard drives.
> - _btrfs_, is experimental, which includes numeroud features that require, to this day, the use of LVM and/or RAID.

## Manual partitioning

You only need to choose the windows partition and enter its new size (this woeks the same with both unencrypted fat and NTFS)
This tool is useful if you are doing a dual boot.

> **Virtual memory swap**
>
> Allows the linux kernel, when lacking sufficient memory (RAM), to free a bit of memory by stoing the parts of the RAM that have been inactive for some time on the swap partition of the hard disk. It is also fundamental to the "suspend" and "hibernate" features of a system.

When you choosing a partition, you can indicate the manner in which you are going to use it:

- format it and include it in the file tree by choosing a mount point;
- use it as a swap partition;
- make it into a “physical volume for encryption” (to protect the confidentiality of data on certain partitions, see below);
- make it a “physical volume for LVM” (this concept is discussed in greater detail later in this chapter);
- use it as a RAID device (see later in this chapter);
- you can also choose not to use it, and therefore leave it unchanged.

## what is a LVM?

LVM allows you to create “virtual” partitions that span over several disks. The benefits are twofold: the size of the partitions are no longer limited by individual disks but by their cumulative volume, and you can resize existing partitions at any time, possibly after adding an additional disk when needed.

## Configuring the package manager (apt)

in order to be able to install additional software, APT needs to be configured and told where to find Debian packages. This steps is as automated as possible.

## Desktop enviroment

If you are installing a server, the best practice is no select any desktop enviroment.

If is a personal or workstation: gnome or kde
else if a low requirements pc: xcfe
