mkdir /mnt/resource/INSTALLERS
tar -xzf /mnt/resource/ANSYS.tgz -C /mnt/resource/INSTALLERS/

cd /mnt/resource/INSTALLERS/ANSYS/
mkdir -p /mnt/nfsshare/ansys_inc/shared_files/licensing/

echo SERVER=1055@52.169.161.205 > /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini
echo ANSYSLI_SERVERS=2325@52.169.161.205 >> /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini

source /mnt/resource/INSTALLERS/ANSYS/INSTALL -silent -install_dir "/mnt/nfsshare/ansys_inc/" -fluent



