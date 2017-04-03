#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: need to specify a host to send to"
  exit 1
fi

ssh_server="$1"
cd ~/.ssh && cat id_rsa.pub | ssh "$ssh_server" \
    'mkdir -p ~/.ssh && chmod go-rwx ~/.ssh && cat >> .ssh/authorized_keys'
#cd ~/.ssh && cat id_rsa.pub | ssh "$ssh_server" 'cat >> .ssh/authorized_keys'
