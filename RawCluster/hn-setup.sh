#!/bin/bash
USER=$1
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
rpm -ivh epel-release-7-8.noarch.rpm

yum install -y -q nfs-utils sshpass nmap
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
mv passwordlessAuth.sh /home/$USER/bin/
nmap -sn $localip.* | grep $localip. | awk '{print $5}' > /home/$USER/bin/nodeips.txt

wget https://raw.githubusercontent.com/tanewill/5clickTemplates/master/RawCluster/install-fluent.sh
chmod +x install-fluent.sh
source install-fluent.sh


