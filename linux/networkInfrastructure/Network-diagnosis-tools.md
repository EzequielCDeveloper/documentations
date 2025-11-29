# Network Diagnosis Tools

## Local Diagnosis: netstat

It displays an instant summary of a machine's network activity. When invoked with no argument: lists all open connections.

Common invocations tehrefore use options that alter netstat's behaviour. The most frequently used options include:]

- _-t_:which filters the results to only include TCP connections;
- _-u_, which works similarly for UDP connections; these options are not mutually exclusive, and one of them is enough to stop displaying Unix-domain connections;
- _-a_, to also list listening sockets (waiting for incoming connections);
- _-n_, to display the results numerically: IP addresses (no DNS resolution), port numbers (no aliases as defined in /etc/services) and user ids (no login names);
- _-p_, to list the processes involved; this option is only useful when netstat is run as root, since normal users will only see their own processes;
- _-c_, to continuously refresh the list of connections.

Other options, documented in the netstat (8) manual page, porvide an even finer control ober the displayed results. In practice, the first five options are so often used together that systems and network administrator practically acquired netstat -tupan as a reflex.

## Remote Diagnosis: nmap

nmap is , in a way, the remote equivalent for netstat. It can scan a set of "well-know" port for one or several remote servers, and list th eports where an application is found to answer to incoming connections. Furthermore, nmap is able to identify some of these applications, sometimes even their version number. The counterpart of this tool is that, since it runs remotely, it cannot provide information on processes or users; however, it can operate on several targetrs at once.
A typical _nmap_ invocation only uses the -A option (so that nmap attpems to identify the version of the servers software int finds) followed byone or more IP addresses or DNS names of machines to scan. Again, may more options exist to finely control the behaviour of nmap; please refer to the documentation in th nmap manual page.

- `nmap <dns or ip>`

- `nmap -A localhost`

## Wireshark

Sometimes, one needs to look at what actually goes on the wire, packet by packet.
Wireshark has become the new reference in network traffic analysis due to its many decoding modules that allow for a simplied analysus of the capture packets,. The packets are displayed graphically with an organization based on the protocol layers. This allows a user to visualize all protocols involved in a packet. For example, given a packet containing an HTTP request, wireshark displays, separately, the information concerning the physical layer, the Ethernet layer, the IP packet information, the TCP connection parameters, and finally the HTTP request itself.
