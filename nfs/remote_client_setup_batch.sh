#!/bin/bash

remote_nfs_client_file=$1
remote_nfs_client_mount_dir=$2
nfs_server=$3
nfs_server_dir=$4

if [ -z "$remote_nfs_client_file" ]; then
  echo "Error: no remote client host file specified"
  exit 1
fi
cat "$remote_nfs_client_file" | {
while read line; do
  echo "############ Setup up $line ###############"
  /setup/nfs/remote_client_setup.sh \
      "$line" "$remote_nfs_client_mount_dir" \
      "$nfs_server" "$nfs_server_dir"
done
}
