#To install and start nfs server:
/setup/nfs/server_install.sh

#Setup nfs server config, expose given dir to a single host
/setup/nfs/server_expose.sh [/dir] [client_host]

#Setup nfs server config, expose /setup dir to a list of host
/setup/nfs/server_expose_batch.sh [/dir] [host_file]

#The host flie is like:
1.2.3.4
1.2.3.5
1.2.3.6

#Setup mount and fstab in client host
/setup/nfs/client_setup.sh [nfs_server_host] [server_nfs_dir] [client_mount_dir]

#Remotely setup mount and fstab in client
/setup/nfs/remote_client_setup.sh [remote_client_host] [remote_client_mount_dir] [nfs_server_host] [nfs_server_dir]
