#!/bin/bash
USER=$1
LICIP=$2
HOST=`hostname`
echo $USER,$LICIP,$HOST

mkdir /mnt/scratch/INSTALLERS
tar -xzf /mnt/scratch/STAR-CCM+11.02.010_01_linux-x86_64-r8.tar.gz -C /mnt/scratch/INSTALLERS/

cd /mnt/scratch/INSTALLERS/starccm+_11.02.010/

#mkdir -p /mnt/nfsshare/ansys_inc/shared_files/licensing/

#echo SERVER=1055@$LICIP > /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini
#echo ANSYSLI_SERVERS=2325@$LICIP >> /mnt/nfsshare/ansys_inc/shared_files/licensing/ansyslmd.ini
echo export PODKey=$LICIP >> /home/$USER/.bashrc
echo export CDLMD_LICENSE_FILE=1999@flex.cd-adapco.com >> /home/$USER/.bashrc
echo export INTELMPI_ROOT=/opt/intel/impi/5.1.3.181 >> /home/$USER/.bashrc
echo export I_MPI_FABRICS=shm:dapl >> /home/$USER/.bashrc
echo export I_MPI_DAPL_PROVIDER=ofa-v2-ib0 >> /home/$USER/.bashrc
echo export I_MPI_ROOT=/opt/intel/compilers_and_libraries_2016.2.181/linux/mpi >> /home/$USER/.bashrc
echo export PATH=/mnt/scratch/applications/STAR-CCM+11.02.010-R8/star/bin:/opt/intel/impi/5.1.3.181/bin64:$PATH >> /home/$USER/.bashrc
echo export I_MPI_DYNAMIC_CONNECTION=0 >> /home/$USER/.bashrc

mkdir /mnt/scratch/applications
sh /mnt/scratch/INSTALLERS/starccm+_11.02.010/STAR-CCM+11.02.010_01_linux-x86_64-2.5_gnu4.8-r8.bin -i silent -DINSTALLDIR=/mnt/scratch/applications -DNODOC=true -DINSTALLFLEX=false
rm -rf /mnt/scratch/STAR-CCM+11.02.010_01_linux-x86_64-r8.tar.gz
rm /mnt/scratch/*.tgz
mkdir /mnt/scratch/benchmark
mv /mnt/scratch/*.sim /mnt/scratch/benchmark
chown -R $USER:$USER /mnt/scratch
chown -R $USER:$USER /mnt/resource/nfsshare

