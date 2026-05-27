#!/bin/bash

shopt -s nullglob

cd /var/spool/bandit24/foo || exit
echo "Executing and deleting all scripts in /var/spool/bandit24/foo:"
for i in * .*; do
  if [ "$i" != "." ] && [ "$i" != ".." ]; then
    echo "Handling $i"
    owner="$(stat --format "%U" "./$i")"
    if [ "${owner}" = "anon" ] && [ -f "$i" ]; then
      timeout -s 9 60 "./$i"
    fi
  fi
done
