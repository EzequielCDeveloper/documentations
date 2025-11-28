The Debian package format is designed so that its content may be extracted on any Unix system that has the classic commands ar, tar, and xz or sometimes gzip or bzip2. This seemingly trivial property is important for portability and disaster recovery.

dpkg is the program that handles _.deb_ files (binary packages), notably extrating, analyzing, and upacking them.

as for the **ar** program, provided by the binutils packages, it allows handling files of the same name:

> - ar t archive displays the list of files contained in such an archive,
> - ar x archive extracts the files from the archive into the current working directory,
> - ar d archive file deletes a file from the archive, etc.

Have a look at the content of a **.deb** file:

```bash
ar t dpkg_1.20.9_amd64.deb
debian-binary
control.tar.gz
data.tar.xz
ar x dpkg_1.20.9_amd64.deb
ls
control.tar.gz  data.tar.xz  debian-binary  dpkg_1.20.9_amd64.deb
tar tJf data.tar.xz | head -n 16
./
./etc/
./etc/alternatives/
./etc/alternatives/README
./etc/cron.daily/
./etc/cron.daily/dpkg
./etc/dpkg/
./etc/dpkg/dpkg.cfg
./etc/dpkg/dpkg.cfg.d/
./etc/logrotate.d/
./etc/logrotate.d/alternatives
./etc/logrotate.d/dpkg
./sbin/
./sbin/start-stop-daemon
./usr/
./usr/bin/
tar tJf control.tar.xz
./
./conffiles
./control
./md5sums
./postrm
cat debian-binary
2.0
```

As you can see, the ar archive of a Debian package is comprised of three files:

- debian-binary
  This is a text file which simply indicates the version of the .deb file package format version. In Debian Bullseye it is still version 2.0.

- control.tar.xz
  This archive file contains all of the available meta-information, like the name and version of the package as well as some scripts to run before, during or after (un-)installation of it. Some of the meta-information allows package management tools to determine if it is possible to install or uninstall it, for example according to the list of packages already on the machine, and if files shipped have been modified locally.

- data.tar.xz, data.tar.bz2, data.tar.gz
  This archive contains all of the files to be extracted from the package; this is where the executable files, libraries, documentation, etc., are all stored. Packages may use different compression formats, in which case the file will be named differently for xz, bzip2 or gzip.

### APT commands extra

These include:

- **_apt-get_**: for retrieval of packages and information about them
  from authenticated sources and for installation, upgrade and
  removal of packages together with their dependencies
- **_apt-cache_**: for querying available information about installed
  as well as installable packages
- **_apt-cdrom_**: to use removable media as a source for packages
- **_apt-config_**: as an interface to the configuration settings
- **_apt-extracttemplates_**: is used by debconf to prompt for configuration
  questions before installation.

## Add Kali sources to APT

The best way to install Kali Linux software to your Debian Linux PC is to add the Kali rolling repo to your system. The reason this is the best way is that Kali is very similar to Debian.

`sudo nvim -w /etc/apt/sources.list`

Inside the sources file, add in the following line of code at the very bottom of the line:

`## Kali Linux Rolling Repo ##`

After adding the top line of code, you'll need to add in this second line directly bellow it. This code is the kali linux software repo URL, and without it, no software will be installed.

`deb http://http.kali.org/kali kali-rooling main contrib non-free`

Once Everything is saved, you'll have to import the kali linux GPG key. This GPG key is essential. Without it, software from kali doesn't work. The quickest way to import the key is to use the _add-apt-key-recover_ command below.

`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys ED444FF07D8D0BF6`

With the kali Linux repo key added to your system, the next step is to run the _update_ command to refresh Debian's software sources.

`sudo apt update && sudo apt -y full-upgrade -y && sudo reboot`

### Installing Kali Linux

Once the Kali Linux software repository is enabled on your system, you dan install kali Linux software onto your Debian system.

`sudo apt install kali-tools-top10`

With the before command, you install the top 10 most uses. however, if you have more specific needs, You have to install _apt search_ tool and type what you wish to search for. For example, to search for Zonemaster in the kali repos, you'd do:

`apt search zonemaster`

## Multi-Arch support

All Debian packages have an Architecture field in their control information. This field can contain either “all” (for packages that are architecture independent) or the name of the architecture that it targets (like “amd64”, “armhf”, …). In the latter case, by default, dpkg will only accept to install the package if its architecture matches the host's architecture as returned by dpkg --print-architecture.

This restriction ensures that users do not end up with binaries compiled for an incorrect architecture. Everything would be perfect except that (some) computers can run binaries for multiple architectures, either natively (an “amd64“ system can run “i386” binaries) or through emulators.

### Enabling Multi-Arch

dpkg's multi-arch support allows users to define “foreign architectures” that can be installed on the current system.
This is simply done with

- `dpkg --add-architecture`
  like in the example below. There is a corresponding
- `dpkg --remove-architecture`
  to drop support of a foreign architecture, but it can only be used when no packages of this architecture remain.

> APT will automatically detect when dpkg has been configured to support foreign architectures and will start downloading the corresponding packages files during its update process
> foreign packages can then be installed with apt install packages: architecture.

> you should know that the program rpm, which handles RPM packages, is available as a Debian package, so it is possible to use this package format on Debian. Care should be taken, however, to limit these manipulations to extract the information from a package or to verify its integrity. It is, in truth, unreasonable to use rpm to install an RPM on a Debian system; RPM uses its own database, separate from those of native software (such as dpkg). This is why it is not possible to ensure a stable coexistence of two packaging systems.
>
> On the other hand, the alien utility can convert RPM packages into Debian packages, and vice versa.

example:

```bash
fakeroot alien --to-deb phpMyAdmin-5.1.1-2.fc35.noarch.rpm
  [..]
  Warning: Skipping conversion of scripts in package phpMyAdmin: postinst
  Warning: Use the --scripts parameter to include the scripts.
  [..]
  phpmyadmin_5.1.1-3_all.deb generated
ls -sh phpmyadmin_5.1.1-3_all.deb
  6,0M phpmyadmin_5.1.1-3_all.deb
  dpkg -c phpmyadmin_5.1.1-3_all.deb
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./etc/
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./etc/httpd/
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./etc/httpd/conf.d/
  -rw-r--r-- root/root      1181 2021-07-27 09:32 ./etc/httpd/conf.d/phpMyAdmin.conf
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./etc/nginx/
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./etc/nginx/default.d/
  -rw-r--r-- root/root       430 2021-07-27 09:32 ./etc/nginx/default.d/phpMyAdmin.conf
  drwxr-x--- root/root         0 2021-08-09 02:02 ./etc/phpMyAdmin/
  -rw-r----- root/root      4546 2021-07-27 09:34 ./etc/phpMyAdmin/config.inc.php
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./usr/
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./usr/share/
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./usr/share/doc/
  drwxr-xr-x root/root         0 2021-08-09 02:02 ./usr/share/doc/phpMyAdmin/
  [..]
dpkg -I phpmyadmin_5.1.1-3_all.deb
 new Debian package, version 2.0.
 size 6195324 bytes: control archive=44444 bytes.
     102 bytes,     3 lines      conffiles
     593 bytes,    15 lines      control
  180405 bytes,  1919 lines      md5sums
     448 bytes,    11 lines   *  postinst             #!/bin/sh
 Package: phpmyadmin
 Version: 5.1.1-3
 Architecture: all
 Maintainer: Daniel Leidert <dleidert@debian.org>
 Installed-Size: 40693
 Section: alien
 Priority: extra
 Description: A web interface for MySQL and MariaDB
  phpMyAdmin is a tool written in PHP intended to handle the administration of
  MySQL over the Web. Currently it can create and drop databases,
  create/drop/alter tables, delete/edit/add fields, execute any SQL statement,
  manage keys on fields, manage privileges,export data into various formats and
  is available in 50 languages
  .
  (Converted from a rpm package by alien version 8.95.4.)
```

You will find that this process is extremely simple. You must know, however, that the package generated does not have any dependency information, since the dependencies in the two packaging formats don't have systematic correspondence. The administrator must thus manually ensure that the converted package will function correctly, and this is why Debian packages thus generated should be avoided as much as possible.
