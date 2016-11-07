#!/bin/bash
USER=$1
LICIP=$2
HOST=`hostname`
echo $USER,$LICIP,$HOST

yum install -y redhat-lsb-core
yum install -y compat-libstdc++-33.i686
yum install -y ksh

mkdir /mnt/scratch/applications
mkdir /mnt/scratch/INSTALLERS
mkdir /mnt/scratch/benchmark
wget http://azbenchmarkstorage.blob.core.windows.net/cdadapcobenchmarkstorage/runAndRecord.java -O /mnt/scratch/benchmark/runAndRecord.java

wget -q http://azbenchmarkstorage.blob.core.windows.net/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.1-3.tar -O /mnt/scratch/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.1-3.tar
wget -q http://azbenchmarkstorage.blob.core.windows.net/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.2-3.tar -O /mnt/scratch/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.2-3.tar
wget -q http://azbenchmarkstorage.blob.core.windows.net/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.3-3.tar -O /mnt/scratch/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.3-3.tar

tar -xf /mnt/scratch/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.1-3.tar -C /mnt/scratch/INSTALLERS/
tar -xf /mnt/scratch/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.2-3.tar -C /mnt/scratch/INSTALLERS/
tar -xf /mnt/scratch/abaqusbenchmarkstorage/2016.AM_SIM_Abaqus.AllOS.3-3.tar -C /mnt/scratch/INSTALLERS/

echo USE THE BELOW COMMANDS AND PATHS FOR EACH STEP IN THE INSTALLATION PROCESS > /mnt/scratch/INSTALLER/install_abq.txt
echo ksh /mnt/resource/scratch/INSTALLERS/AM_SIM_Abaqus.AllOS/1/3DEXPERIENCE_AbaqusSolver/Linux64/1/StartTUI.sh >> /mnt/scratch/INSTALLER/install_abq.txt
echo	/mnt/resource/scratch/applications/DassaultSystemes/SimulationServices/V6R2016x >>  /mnt/scratch/INSTALLER/install_abq.txt
echo  >>  /mnt/scratch/INSTALLER/install_abq.txt
echo ksh /mnt/resource/scratch/INSTALLERS/AM_SIM_Abaqus.AllOS/1/SIMULIA_Abaqus_CAE/Linux64/1/StartTUI.sh >>  /mnt/scratch/INSTALLER/install_abq.txt
echo	/mnt/resource/scratch/applications/SIMULIA/CAE/2016 >>  /mnt/scratch/INSTALLER/install_abq.txt
echo	/mnt/resource/scratch/applications/DassaultSystemes/SimulationServices/V6R2016x >>  /mnt/scratch/INSTALLER/install_abq.txt
echo	/mnt/resource/scratch/applications/DassaultSystemes/SIMULIA/Commands >>  /mnt/scratch/INSTALLER/install_abq.txt
echo /mnt/resource/scratch/temp >>  /mnt/scratch/INSTALLER/install_abq.txt
echo  >>  /mnt/scratch/INSTALLER/install_abq.txt
echo LICENSE IS AT $LICIP >>  /mnt/scratch/INSTALLER/install_abq.txt

echo export HOSTS=/home/$USER/bin/nodenames.txt
echo export INTELMPI_ROOT=/opt/intel/impi/5.1.3.181 >> /home/$USER/.bashrc
echo export I_MPI_FABRICS=shm:dapl >> /home/$USER/.bashrc
echo export I_MPI_DAPL_PROVIDER=ofa-v2-ib0 >> /home/$USER/.bashrc
echo export I_MPI_ROOT=/opt/intel/compilers_and_libraries_2016.2.181/linux/mpi >> /home/$USER/.bashrc
echo export PATH=/mnt/resource/scratch/applications/DassaultSystemes/SIMULIA/Commands:$PATH >> /home/$USER/.bashrc
echo export I_MPI_DYNAMIC_CONNECTION=0 >> /home/$USER/.bashrc

sh /mnt/scratch/INSTALLERS/starccm+_11.02.010/STAR-CCM+11.02.010_01_linux-x86_64-2.5_gnu4.8-r8.bin -i silent -DINSTALLDIR=/mnt/scratch/applications -DNODOC=true -DINSTALLFLEX=false
rm -rf /mnt/scratch/STAR-CCM+11.02.010_01_linux-x86_64-r8.tar.gz
rm /mnt/scratch/*.tgz
mv /mnt/scratch/*.sim /mnt/scratch/benchmark
chown -R $USER:$USER /mnt/scratch/*
chown -R $USER:$USER /mnt/nfsshare

