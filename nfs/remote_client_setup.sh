#!/bin/bash

remote_nfs_client=$1
remote_nfs_client_mount_dir=$2
nfs_server=$3
nfs_server_dir=$4

# It's very tricy to execute script remotely with args,
# See: http://unix.stackexchange.com/questions/87405/how-can-i-execute-local-script-on-remote-machine-and-include-arguments
ssh root@"$remote_nfs_client" "bash -s" -- < /setup/nfs/client_setup.sh \
     "$nfs_server" "$nfs_server_dir" "$remote_nfs_client_mount_dir"
