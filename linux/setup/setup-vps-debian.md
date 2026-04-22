Connect to vps

- `ssh user@ip-here`
  Whenever you login to a new vps always add a new user account
  It is not advisable to work as the root user.

## Add user

- `adduser user`
  Add sudo permissions to the new user.
- `usermod -aG sudo user`
- `su - user`

## Domain name

2026-02-25T21:52:23Z INF Added CNAME cleyvadev.com which will route to this tunnel tunnelID=e560ecb4-e8af-4cec-99df-1db39aa9aefb

GRANT ALL ON wordpress.\* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'Wordpr3ss!!';
