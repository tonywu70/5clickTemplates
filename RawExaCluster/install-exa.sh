#!/bin/bash
USER=$1
LICIP=$2
HOST=`hostname`
DOWN=$3
echo $USER,$LICIP,$HOST,$DOWN

mkdir /mnt/scratch/applications
mkdir /mnt/scratch/INSTALLERS
mkdir /mnt/scratch/benchmark

wget -q http://azbenchmarkstorage.blob.core.windows.net/cdadapcobenchmarkstorage/runAndRecord.java -O /mnt/scratch/benchmark/runAndRecord.java
wget -q http://azbenchmarkstorage.blob.core.windows.net/cdadapcobenchmarkstorage/STAR-CCM+11.04.012_01_linux-x86_64-r8.tar.gz -O /mnt/scratch/STAR-CCM+11.04.012_01_linux-x86_64-r8.tar.gz
wget -q http://azbenchmarkstorage.blob.core.windows.net/cdadapcobenchmarkstorage/$DOWN -O /mnt/scratch/$DOWN

tar -xf /mnt/scratch/$DOWN -C /mnt/scratch
tar -xzf /mnt/scratch/STAR-CCM+11.04.012_01_linux-x86_64-r8.tar.gz -C /mnt/scratch/INSTALLERS/

cd /mnt/scratch/INSTALLERS/starccm+_11.04.012/

echo export PODKey=$LICIP >> /home/$USER/.bashrc
echo export CDLMD_LICENSE_FILE=1999@flex.cd-adapco.com >> /home/$USER/.bashrc
echo export HOSTS=/home/$USER/bin/nodenames.txt
echo export INTELMPI_ROOT=/opt/intel/impi/5.1.3.181 >> /home/$USER/.bashrc
echo export I_MPI_FABRICS=shm:dapl >> /home/$USER/.bashrc
echo export I_MPI_DAPL_PROVIDER=ofa-v2-ib0 >> /home/$USER/.bashrc
echo export I_MPI_ROOT=/opt/intel/compilers_and_libraries_2016.2.181/linux/mpi >> /home/$USER/.bashrc
echo export PATH=/mnt/scratch/applications/STAR-CCM+11.04.012-R8/star/bin:/opt/intel/impi/5.1.3.181/bin64:$PATH >> /home/$USER/.bashrc
echo export I_MPI_DYNAMIC_CONNECTION=0 >> /home/$USER/.bashrc
echo '/mnt/scratch/applications/STAR-CCM+11.04.012-R8/star/bin/starccm+ -np 8 -machinefile '$HOSTS' -power -podkey '$PODKey' -rsh ssh -mpi intel -cpubind bandwidth,v -mppflags " -ppn 8 -genv I_MPI_DAPL_PROVIDER=ofa-v2-ib0 -genv I_MPI_DAPL_UD=0 -genv I_MPI_DYNAMIC_CONNECTION=0" -batch runAndRecord.java /mnt/scratch/benchmark/*.sim' >> /mnt/scratch/benchmark/runccm_example.sh

sh /mnt/scratch/INSTALLERS/starccm+_11.04.012/STAR-CCM+11.04.012_01_linux-x86_64-2.5_gnu4.8-r8.bin -i silent -DINSTALLDIR=/mnt/scratch/applications -DNODOC=true -DINSTALLFLEX=false
rm -rf /mnt/scratch/STAR-CCM+11.04.010_01_linux-x86_64-r8.tar.gz
rm /mnt/scratch/*.tgz
mv /mnt/scratch/*.sim /mnt/scratch/benchmark
chown -R $USER:$USER /mnt/scratch/*
chown -R $USER:$USER /mnt/nfsshare
