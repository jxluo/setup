#!/bin/bash

nfs_server_host=$1
nfs_server_dir=$2
mount_dir=$3

echo '#### Install nfs-common if needed'
apt-get install -y nfs-common

if [ -z "$nfs_server_host" ]; then
  echo "Error: no server host"
  exit 1
fi
if [ -z "$nfs_server_dir" ]; then
  echo "Error: no server dir"
  exit 1
fi
if [ -z "$mount_dir" ]; then
  echo "Error: no mount dir"
  exit 1
fi

echo ''
echo '#### Mount the nfs directory'
if [ ! -z "$(df | grep "$nfs_server_host")" ]; then
  echo $nfs_server_host already mounted
else
  mkdir -p "$mount_dir"
  mount "$nfs_server_host":"$nfs_server_dir" "$mount_dir" && \
      echo 'Mount nfs dir done'
fi

echo ''
echo '#### setup /etc/fstab to mount nfs when reboot'
fstab_config="$nfs_server_host:$nfs_server_dir	$mount_dir nfs auto 0 0"

if [ ! -z "$(cat /etc/fstab | grep "$nfs_server_host")" ]; then
  echo $nfs_server_host already setup at /etc/fstab
else
  echo "$fstab_config" >> /etc/fstab
  echo 'Setup /etc/fstab done'
fi
