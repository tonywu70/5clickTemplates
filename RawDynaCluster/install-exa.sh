#!/bin/bash
USER=$1
LICIP=$2
HOST=`hostname`
DOWN=$3
echo $USER,$LICIP,$HOST,$DOWN

yum install -y compat-libstdc++-33.i686
#yum install -y rsh

mkdir /mnt/resource/scratch/applications
mkdir /mnt/resource/scratch/INSTALLERS
mkdir /mnt/resource/scratch/benchmark

wget -q http://azbenchmarkstorage.blob.core.windows.net/exabenchmarkstorage/.mpifile -O /mnt/resource/scratch/benchmark/.mpifile
wget -q http://azbenchmarkstorage.blob.core.windows.net/exabenchmarkstorage/powerflow-5.3c-linux.tar.gz -O /mnt/resource/scratch/powerflow-5.3c-linux.tar.gz
wget -q http://azbenchmarkstorage.blob.core.windows.net/cdadapcobenchmarkstorage/$DOWN -O /mnt/resource/scratch/$DOWN

tar -xf /mnt/resource/scratch/$DOWN -C /mnt/resource/scratch
tar -xzf /mnt/resource/scratch/powerflow-5.3c-linux.tar.gz -C /mnt/resource/scratch/INSTALLERS/

cd /mnt/resource/scratch/INSTALLERS/powerflow-5.3c

echo export HOSTS=/home/$USER/bin/nodenames.txt
echo export INTELMPI_ROOT=/opt/intel/impi/5.1.3.181 >> /home/$USER/.bashrc
echo export I_MPI_FABRICS=shm:dapl >> /home/$USER/.bashrc
echo export I_MPI_DAPL_PROVIDER=ofa-v2-ib0 >> /home/$USER/.bashrc
echo export I_MPI_ROOT=/opt/intel/compilers_and_libraries_2016.2.181/linux/mpi >> /home/$USER/.bashrc
echo export I_MPI_DYNAMIC_CONNECTION=0 >> /home/$USER/.bashrc

chown -R $USER:$USER /mnt/resource/scratch/*
chown -R $USER:$USER /mnt/nfsshare
