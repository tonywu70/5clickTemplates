mkdir /mnt/resource/INSTALLERS

wget --quiet http://azbenchmarkstorage.blob.core.windows.net/ansysbenchmarkstorage/ANSYS.tgz -O /mnt/resource/ANSYS.tgz
tar -xzf /mnt/resource/ANSYS.tgz -C /mnt/resource/INSTALLERS/

cd /mnt/resource/INSTALLERS/ANSYS/
source /mnt/resource/INSTALLERS/ANSYS/INSTALL -silent -install_dir "/mnt/nfsshare/ansys_inc/" -fluent

echo SERVER=1055@52.169.161.205 > /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini
echo ANSYSLI_SERVERS=2325@52.169.161.205 >> /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini

