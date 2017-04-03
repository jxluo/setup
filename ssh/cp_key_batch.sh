#!/bin/bash
cat "$1" | {
while read line;do
  /setup/ssh/cp_key.sh root@"$line"
done
}
