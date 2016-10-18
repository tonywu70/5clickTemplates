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

wget -q http://azbenchmarkstorage.blob.core.windows.net/dynabenchmarkstorage/ls-dyna_mpp_s_r7_1_2_95028_x64_redhat54_ifort131_sse2_intelmpi-413.tar.gz -O /mnt/resource/scratch/INSTALLERS/ls-dyna_mpp_s_r7_1_2_95028_x64_redhat54_ifort131_sse2_intelmpi-413.tar.gz
wget -q http://azbenchmarkstorage.blob.core.windows.net/dynabenchmarkstorage/neon_refined_revised.tar.gz -O /mnt/resource/scratch/benchmark/neon_refined_revised.tar.gz

echo export HOSTS=/home/$USER/bin/nodenames.txt
echo export INTELMPI_ROOT=/opt/intel/impi/5.1.3.181 >> /home/$USER/.bashrc
echo export I_MPI_FABRICS=shm:dapl >> /home/$USER/.bashrc
echo export I_MPI_DAPL_PROVIDER=ofa-v2-ib0 >> /home/$USER/.bashrc
echo export I_MPI_ROOT=/opt/intel/compilers_and_libraries_2016.2.181/linux/mpi >> /home/$USER/.bashrc
echo export I_MPI_DYNAMIC_CONNECTION=0 >> /home/$USER/.bashrc

cd /mnt/resource/scratch/INSTALLERS/
gunzip ls-dyna_mpp_s_r7_1_2_95028_x64_redhat54_ifort131_sse2_intelmpi-413.tar.gz
tar -xf ls-dyna_mpp_s_r7_1_2_95028_x64_redhat54_ifort131_sse2_intelmpi-413.tar
