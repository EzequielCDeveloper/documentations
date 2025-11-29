## Introduction

Certificates are an important building block of many network services built on cryptographic protocols, when they need some sort of centrall authentication.
Amoung those protocols, SSL (Secure Socket Layes) was invented by Netscape to secure connections to web servers. It was later standardized by IRTF under the acronym TLS (Transport Layer Security). Since then TLS continued to evolved, and nowadasys SSL is deprecated due to multiple design flaws that have been dicovered.
The TLS protocol aims primarily to provide privacy and data integrity between a client (web browser) and a server.

A key pari is needed for the exchange of information, which involves a public key that includes information about the identity of the owner and matches a private key. The private key must be kept secret, otherwise the Security is compromised.

The Certificates X.509 standard, covers an entity that holds a trusted key pair knonw as a root Certificate. This Certificate is only used to sign other Certificates (key pairs), after proper steps have been undertaken to chech the identity stored on the key pair.

### Creating trusted Certificates

Many programs create and use snakeoil certificates by default. The falcot administrators just want to create a certificate for their website, which runs on Apache. The is a convenient Apache plugin for certbot that automatically edits the Apache configuration to serve the obtained certificate, so they make use of it:

```bash
# apt install python3-certbot-apache
[...]
# certbot --apache
aving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator apache, Installer apache
Enter email address (used for urgent renewal and security notices)
 (Enter 'c' to cancel): admin@falcot.com

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server. Do you agree?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: Y

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing, once your first certificate is successfully issued, to
share your email address with the Electronic Frontier Foundation, a founding
partner of the Let's Encrypt project and the non-profit organization that
develops Certbot? We'd like to send you email about our work encrypting the web,
EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o:  N

Account registered.

No names were found in your configuration files. Please enter in your domain
name(s) (comma and/or space separated)  (Enter 'c' to cancel): falcot.com

Requesting a certificate for falcot.com
Performing the following challenges:
http-01 challenge for falcot.com
Enabled Apache rewrite module
Waiting for verification...
Cleaning up challenges
Created an SSL vhost at /etc/apache2/sites-available/000-default-le-ssl.conf
Enabled Apache socache_shmcb module
Enabled Apache ssl module
Deploying Certificate to VirtualHost /etc/apache2/sites-available/000-default-le-ssl.conf
Enabling available site: /etc/apache2/sites-available/000-default-le-ssl.conf

Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the webserver configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for
new sites, or if you're confident your site works on HTTPS. You can undo this
change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Select the appropriate number [1-2] then [enter] (press 'c' to cancel): 2

Enabled Apache rewrite module
Redirecting vhost in /etc/apache2/sites-enabled/000-default.conf to ssl vhost in /etc/apache2/sites-available/000-default-le-ssl.conf

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully enabled https://falcot.com

You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=falcot.com
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/falcot.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/falcot.com/privkey.pem
   Your cert will expire on 2022-06-04. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

### public key infrastructure: easy-rsa

It is also possible to create our own CA, for that we will use the RSA algorithm, widely used in public-key cryptography. It involves a “key pair”, comprised of a private and a public key. The two keys are closely linked to each other, and their mathematical properties are such that a message encrypted with the public key can only be decrypted by someone knowing the private key, which ensures confidentiality. In the opposite direction, a message encrypted with the private key can be decrypted by anyone knowing the public key, which allows authenticating the origin of a message since only someone with access to the private key could generate it. When associated with a digital hash function (MD5, SHA1, or a more recent variant), this leads to a signature mechanism that can be applied to any message.

Since public CAs only emit certificates in exchange for a (hefty) fee, it is also possible to create a private certification authority within the company. The easy-rsa package provides tools to serve as an X.509 certification infrastructure, implemented as a set of scripts using the openssl command.
The Falcot Corp administrators use this tool to create the required certificates, both for the server and the clients. This allows the configuration of all clients to be similar since they will only have to be set up so as to trust certificates coming from Falcot's local CA. This CA is the first certificate to create; to this end, the administrators set up a directory with the files required for the CA in an appropriate location, preferably on a machine not connected to the network in order to mitigate the risk of the CA's private key being stolen.

`$ make-cadir pki-falcot`
`$ cd pki-falcot`
They then store the required parameters into the vars file, which can be uncommented and edited:

```bash
$ grep EASYRSA vars
if [ -z "$EASYRSA_CALLER" ]; then

# easyrsa. More specific variables for specific files (e.g., EASYRSA_SSL_CONF)

#set_var EASYRSA "${0%/*}"
#set_var EASYRSA_OPENSSL "openssl"
#set_var EASYRSA_OPENSSL "C:/Program Files/OpenSSL-Win32/bin/openssl.exe"
#set_var EASYRSA_PKI  "$PWD/pki"
#set_var EASYRSA_TEMP_DIR "$EASYRSA_PKI"
#set_var EASYRSA_DN "cn_only"
set_var EASYRSA_REQ_COUNTRY "FR"
set_var EASYRSA_REQ_PROVINCE "Loire"
set_var EASYRSA_REQ_CITY "Saint-Étienne"
set_var EASYRSA_REQ_ORG "Falcot Corp"
set_var EASYRSA_REQ_EMAIL "admin@falcot.com"
set_var EASYRSA_REQ_OU  "Certificate authority"
#set_var EASYRSA_KEY_SIZE 2048
#set_var EASYRSA_ALGO  rsa
#set_var EASYRSA_CURVE  secp384r1
#set_var EASYRSA_CA_EXPIRE 3650
#set_var EASYRSA_CERT_EXPIRE 825
#set_var EASYRSA_CRL_DAYS 180
#set_var EASYRSA_CERT_RENEW 30
#set_var EASYRSA_RAND_SN "yes"
#set_var EASYRSA_NS_SUPPORT "no"
#set_var EASYRSA_NS_COMMENT "Easy-RSA Generated Certificate"
#set_var EASYRSA_TEMP_FILE "$EASYRSA_PKI/extensions.temp"

# when undefined here, default behaviour is to look in $EASYRSA_PKI first, then

# fallback to $EASYRSA for the 'x509-types' dir. You may override this

#set_var EASYRSA_EXT_DIR "$EASYRSA/x509-types"
#set_var EASYRSA_KDC_REALM "CHANGEME.EXAMPLE.COM"

# EASYRSA_PKI or EASYRSA dir (in that order.) NOTE that this file is Easy-RSA

#set_var EASYRSA_SSL_CONF "$EASYRSA/openssl-easyrsa.cnf"
#set_var EASYRSA_REQ_CN  "ChangeMe"
#set_var EASYRSA_DIGEST  "sha256"
#set_var EASYRSA_BATCH  ""
$ vim vars
$
```

Now we prepare the public key infrastructure directory with the following command:

`$ ./easyrsa init-pki`

init-pki complete; you may now create a CA or requests.
Your newly created PKI dir is: /home/debian/pki-falcot/pki

The next step is the creation of the CA's key pair itself (the two parts of the key pair will be stored under pki/ca.crt and pki/private/ca.key during this step). We can add the option nopass to avoid entering a password each time the private key is used:

````bash
$ ./easyrsa build-ca nopass

Using SSL: openssl OpenSSL 1.1.1k 25 Mar 2021
Generating RSA private key, 2048 bit long modulus (2 primes)
..................+++++
...............................+++++
e is 65537 (0x010001)
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.

---

Common Name (eg: your user, host, or server name) [Easy-RSA CA]:

CA creation complete and you may now import and sign cert requests.
Your new CA certificate file for publishing is at:
/home/debian/pki-falcot/pki/ca.crt```

The certificate can now be created, as well as the Diffie-Hellman parameters required for the server side of an SSL/TLS connection.
They want to use it for a VPN server hat is identified by the DNS name vpn.falcot.com; this name is re-used for the generated key files (keys/vpn.falcot.com.crt for the public certificate, keys/vpn.falcot.com.key for the private key):
```bash
$ ./easyrsa gen-req vpn.falcot.com nopass

Using SSL: openssl OpenSSL 1.1.1k 25 Mar 2021
Generating a RSA private key
......................................+++++
..........................................................................+++++
writing new private key to '/home/debian/pki-falcot/pki/easy-rsa-5515.0PwyXl/tmp.g1c6u6'

---

You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.

---

Common Name (eg: your user, host, or server name) [vpn.falcot.com]:

Keypair and certificate request completed. Your files are:
req: /home/debian/pki-falcot/pki/reqs/vpn.falcot.com.req
key: /home/debian/pki-falcot/pki/private/vpn.falcot.com.key

$ ./easyrsa sign-req server vpn.falcot.com

Using SSL: openssl OpenSSL 1.1.1k 25 Mar 2021

You are about to sign the following certificate.
Please check over the details shown below for accuracy. Note that this request
has not been cryptographically verified. Please be sure it came from a trusted
source or that you have verified the request checksum with the sender.

Request subject, to be signed as a server certificate for 825 days:

subject=
commonName = vpn.falcot.com

Type the word 'yes' to continue, or any other input to abort.
Confirm request details: yes
Using configuration from /home/debian/pki-falcot/pki/easy-rsa-5603.87iCIa/tmp.u8r8Fj
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName :ASN.1 12:'vpn.falcot.com'
Certificate is to be certified until May 27 15:26:29 2024 GMT (825 days)

Write out database with 1 new entries
Data Base Updated

Certificate created at: /home/debian/pki-falcot/pki/issued/vpn.falcot.com.crt

`$ ./easyrsa gen-dh`

Using SSL: openssl OpenSSL 1.1.1k 25 Mar 2021
Generating DH parameters, 2048 bit long safe prime, generator 2
This is going to take a long time
[…]

DH parameters of size 2048 created at /home/debian/pki-falcot/pki/dh.pem

The following step creates certificates for the VPN clients; one certificate is required for each computer or person allowed to use the VPN:

`$ ./easyrsa build-client-full JoeSmith nopass`

Using SSL: openssl OpenSSL 1.1.1k 25 Mar 2021
Generating a RSA private key
...................................+++++
.........................................................................................+++++
writing new private key to '/home/debian/pki-falcot/pki/easy-rsa-5694.DOYwSn/tmp.RKlbOE'

---

Using configuration from /home/debian/pki-falcot/pki/easy-rsa-5694.DOYwSn/tmp.d5QHAC
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName :ASN.1 12:'JoeSmith'
Certificate is to be certified until May 27 15:29:25 2024 GMT (825 days)

Write out database with 1 new entries
Data Base Updated
````
