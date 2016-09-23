#!/bin/bash
IPPRE=$1
yum install -y -q nfs-utils
mkdir -p /mnt/nfsshare
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap
localip=`hostname -i | cut --delimiter='.' -f -3`
echo "$IPPRE:/mnt/nfsshare    /mnt/nfsshare   nfs defaults 0 0" | tee -a /etc/fstab
mount -a

ln -s /opt/intel/impi/5.1.3.181/intel64/bin/ /opt/intel/impi/5.1.3.181/bin
ln -s /opt/intel/impi/5.1.3.181/lib64/ /opt/intel/impi/5.1.3.181/lib
