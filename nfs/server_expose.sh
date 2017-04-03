#!/bin/bash

dir="$1"
if [ -z "$dir" ]; then
  echo "Error: no dir to expose"
  exit 1
fi
host="$2"
if [ -z "$host" ]; then
  echo "Error: no host to expose"
  exit 1
fi

config_prefix="$dir	$host"
config_text="$config_prefix"'(rw,sync,no_root_squash,no_subtree_check)'
if [ ! -z "$(cat /etc/exports | grep "$config_prefix")" ]; then
  echo Already expose "$dir" to "$host"
  exit 0
fi

echo "$config_text" >> /etc/exports
exportfs -arv 
