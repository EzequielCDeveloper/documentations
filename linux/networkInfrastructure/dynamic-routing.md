# Dynamic Routing

The reference tool for dynamic routing is currently **_frr_** from the similarly-named package; it used to be _quagga_, and before that _zebra_ until development of these stopped. However, **_frr_** kept the names of the programs for compatibility reasons which explains the _zebra_ commands below

> Dynamic routing allows routes to adjust, in real time , the parhs used for transmitting IP packets. Each protocol involves its own method of defining routes (shortest path, use routes advestised by peers, and so on).
> In the linux kenel, a route links a network device to a set of machines that can be reached through this debice.
>
> - **ip** command, when route is used as the firts argument, defines new routes and displays existing ones.
> - **route** command, was used for that purpose, but it is deprecated in favor of **ip**.

FRR (FRRouting) is a set of daemons cooperating to define the routing tables to be used by the linux kernel; each routing protocol (most notably BGP, OSPF and RIP) provides its own daemos(s) The zebra and staticd daemons, which are always started, collect information from other daemons and handle stainc routing tables accordingly. The other daemons are known as _bgpd_, _ospfd_, -ospfd6-, _ripd_, _ripngd_, _isid_, etc.

Dameons are enabled by creating the /etc/frr/daemon.conf config file,daemon being the name of the daemnon to use, and editing the /etc/frr/daemons configuration file. The daemon config file must belong to the frr user and group with permissions of 0640 in order for the /etc/init.d/frr script or the frr.service systemd service file to invoke the daemon. The package frr provides configuration examples under /usr/share/doc/frr/examples/.

The configuration of each of these daemons requieres knowledge of the routing protocol in question. These protocols cannot be described in detail here, but frr-doc provides ample explanation in the form jof both info and HTML files. The same contens may be more browsed on the projects website:

<http://docs.frrouting.org/en/latest/>

In addition, the syntax is very close to a standard router's configuration interface, and network administrator will adapt quickly to frr.

> OSPF(Open Shortest Path First):
> is generally the best protocol to use for dynamic routing on private networks, but BGP (Border GateWay Protocol)is more common for internet-wide routing. RIP (Routing Information Protocol) is rather ancient, and hardly used anymore.
