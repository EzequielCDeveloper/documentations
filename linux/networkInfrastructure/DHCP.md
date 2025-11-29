# DHCP

DHCP (for Dynamically Host Configuration Protocol) is a protocol by which a machine can automaticamically gey its network configurations, and ensuring that all desktop machines get similar settings.

A DHCP server provides many networkd-related parameters. The most common of these is an IP addresssss and the network where the machine belongs, but it can also porvide othe information, such as FNS servers, WINS servers, NTP servers, and so on.

The internet software Consortium (also involved in debeloping _bind_) is the main author of the DHCP sercer. The matching Debian package is isc-dhcp-server.

## Configuring

The first elements that need to be edited in the DHCP server configuration files (/etc/dhcp/dhcpd.conf, and /etc/dhcp/dhcpd6.conf for IPv6) are the domain name and the DNS servers. If this servcer is alone on the local network (as defined by the broadcast propagation), the autoritative directive must also be enabled (or uncommented).One also needs to create a subnet section describing the local network and the configuration information to be provided. The following example fits a 192.168.0.0/24 local network with a router at 192.168.0.1 serving as the gateway. Available IP address are in the range 192.168.0.128 to 192.168.0.254.

### Excerpt of /etc/dhcp/dhcp.conf

```bash
#
# Sample configuration file for ISC dhcpd for Debian
#

# The ddns-updates-style parameter controls whether or not the server will
# attempt to do a DNS update when a lease is confirmed. We default to the
# behavior of the version 2 packages ('none', since DHCP v2 didn't
# have support for DDNS.)
ddns-update-style interim;

# option definitions common to all supported networks...
option domain-name "internal.falcot.com";
option domain-name-servers ns.internal.falcot.com;

default-lease-time 600;
max-lease-time 7200;

# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
authoritative;

# Use this to send dhcp log messages to a different log file (you also
# have to hack syslog.conf to complete the redirection).
log-facility local7;

# My subnet
subnet 192.168.0.0 netmask 255.255.255.0 {
    option routers 192.168.0.1;
    option broadcast-address 192.168.0.255;
    range 192.168.0.128 192.168.0.254;
    ddns-domainname "internal.falcot.com";
}
```

### DHCP and DNS

A nice feature is the automated registering of DHCP clients in the DNS zone, so that each machine gets a significant name (rather than something impersonal such as machine-192-168-0-131.internal.falcot.com). Using this feature requieres configuring the DNS server to accept updates to the internal.falcot.com DNS zone from the DHCP server, and configuring the latter to submit updates for each registration.

In the _bind_ case the allow-update directive need to be added to each of the zones that the DHCP server is to edit (the ona for the internal.falcot.com domain, and the reverse zone). This directive list the IP adderesses allowed to perform these updates; it should thererfore contain the possible addresses of the DHCP server (both the local address an the public addresssss, ip appropiate).

allow-update { 127.0.0.1 192.168.0.1 212.94.201.10 | any }

Beware! A zone that can be modified will be change by _bind_, and the latter will oberwrite its configuration files at regular intervals. Since this automated procedure produces files that are less human-readable that manually-written ones, the falcot administrators handle the internal.falcot.com domain with a delegated DNS server; this mean the falcot.com zone stays firmly under their manual control.

The DHCP server configuration Excerpt above already includes the directives required for DNS zone updates: they are the ddns-update-style interim; and ddns-domain-name "internal.falcot"; lines
