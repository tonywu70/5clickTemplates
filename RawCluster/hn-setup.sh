#!/bin/bash

yum install -y -q nfs-utils 
mkdir -p /mnt/nfsshare
chmod -R 777 /mnt/nfsshare/
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
localip=`hostname -i | cut --delimiter='.' -f -3`
echo "/mnt/nfsshare $localip.*(rw,sync,no_root_squash,no_all_squash)" | tee -a /etc/exports
systemctl restart nfs-server
