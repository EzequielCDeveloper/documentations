## Gateway

Is a system linking several networks. This term often refers to a local networks "exit point" on the mandatory path to all external IP addresses. The gateway is connected to each of the networks it links together, and acts as a router to convey IP packets between its various interfaces.

When a local network uses a private address range (not routable on the Internet), the gateway needs to implement address masquerading so that the machines on the network can communicate with the outside world. The masquerading operation is a kind of proxy operating on the network level: each outgoing connection from an internal machine is replaced with a connection from the gateway itself (since the gateway does have an external, routable address), the data going through the masqueraded connection is sent to the new one, and the data coming back in reply is sent through to the masqueraded connection to the internal machine. The gateway uses a range of dedicated TCP ports for this purpose, usually with very high numbers (over 60000). Each connection coming from an internal machine then appears to the outside world as a connection coming from one of these reserved ports.

The gateway can also perform two kinds of network address translation (or NAT for short). The first kind, Destination NAT (DNAT) is a technique to alter the destination IP address (and/or the TCP or UDP port) for a (generally) incoming connection. The connection tracking mechanism also alters the following packets in the same connection to ensure continuity in the communication. The second kind of NAT is Source NAT (SNAT), of which masquerading is a particular case;

SNAT alters the source IP address (and/or the TCP or UDP port) of a (generally) outgoing connection. As for DNAT, all the packets in the connection are appropriately handled by the connection tracking mechanism. Note that NAT is only relevant for IPv4 and its limited address space; in IPv6, the wide availability of addresses greatly reduces the usefulness of NAT by allowing all “internal” addresses to be directly routable on the Internet (this does not imply that internal machines are accessible, since intermediary firewalls can filter traffic).

> Turnign a Debian System into a gateway:  
> `# echo 1 > /proc/sys/net/ipv4/conf/default/forwarding`  
> This option can also be automatically enabled on boot if `/etc/sysctl.conf/` or a
> configuration file in `/etc/sysctl.d/` sets the net.ipv4.conf.default.forwarding option to 1
>
> Example, the /etc/sysctl.conf file:
> net.ipv4.conf.default.forwarding = 1
> net.ipv4.conf.default.rp_filter = 1  
> net.ipv4.tcp_syncookies = 1
>
> The same can be obtained for IPv6, just ipv4 to ipv6.
