mkdir /mnt/ANSYS1
mkdir /mnt/ANSYS2
mkdir /mnt/ANSYS3
mkdir /mnt/resource/INSTALLERS

wget http://azbenchmarkstorage.blob.core.windows.net/ansysbenchmarkstorage/ANSYS.tgz -O /mnt/resource/ANSYS.tgz
tar -xzf /mnt/resource/ANSYS.tgz -C /mnt/resource/INSTALLERS/

source /mnt/resource/INSTALLERS/ANSYS/INSTALL -silent -install_dir "/mnt/nfsshare/ansys_inc/" -fluent
