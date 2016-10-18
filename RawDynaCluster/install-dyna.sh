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

wget -q http://azbenchmarkstorage.blob.core.windows.net/dynabenchmarkstorage/ls-dyna_mpp_s_r7_1_2_95028_x64_redhat54_ifort131_sse2_intelmpi-413.tar.gz
wget -q http://azbenchmarkstorage.blob.core.windows.net/dynabenchmarkstorage/neon_refined_revised.tar.gz
