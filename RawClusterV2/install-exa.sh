#!/bin/bash
USER=$1
#LICIP=$2
HOST=`hostname`
#echo $USER,$LICIP,$HOST

mkdir /mnt/resource/scratch
mkdir /mnt/resource/scratch/benchmark
mkdir /mnt/resource/scratch/INSTALLERS

wget http://azbenchmarkstorage.blob.core.windows.net/exabenchmarkstorage/powerflow-5.3c-linux.tar.gz -O /mnt/resource/scratch/INSTALLERS/powerflow.tgz

chown -R $1:$1 /mnt/resource/scratch
