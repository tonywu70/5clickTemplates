#!/bin/bash
USER=$1
HOST=`hostname`

mkdir /mnt/resource/INSTALLERS
tar -xzf /mnt/resource/ANSYS.tgz -C /mnt/resource/INSTALLERS/

cd /mnt/resource/INSTALLERS/ANSYS/
mkdir -p /mnt/nfsshare/ansys_inc/shared_files/licensing/

echo SERVER=1055@52.169.161.205 > /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini
echo ANSYSLI_SERVERS=2325@52.169.161.205 >> /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini

echo export FLUENT_HOSTNAME=$HOST >> /home/$USER/.bashrc
echo export INTELMPI_ROOT=/opt/intel/impi/5.1.3.181 >> /home/$USER/.bashrc
echo export I_MPI_FABRICS=shm:dapl >> /home/$USER/.bashrc
echo export I_MPI_DAPL_PROVIDER=ofa-v2-ib0 >> /home/$USER/.bashrc
echo export PATH=/mnt/nfsshare/ansys_inc/v172/fluent/bin:/opt/intel/impi/5.1.3.181/bin64:$PATH >> /home/$USER/.bashrc
echo export I_MPI_DYNAMIC_CONNECTION=0 >> /home/$USER/.bashrc

source /mnt/resource/INSTALLERS/ANSYS/INSTALL -silent -install_dir "/mnt/nfsshare/ansys_inc/" -fluent



