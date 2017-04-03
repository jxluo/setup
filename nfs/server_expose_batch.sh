#!/bin/bash

dir="$1"
if [ -z "$dir" ]; then
  echo "Error: no dir to expose"
  exit 1
fi
hosts_file="$2"
if [ -z "$hosts_file" ]; then
  echo "Error: no host file specified"
  exit 1
fi
cat "$hosts_file" | {
while read line; do
  /setup/nfs/server_expose.sh "$dir" "$line"
done
}
