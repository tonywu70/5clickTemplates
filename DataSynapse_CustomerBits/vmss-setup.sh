#!/bin/bash
TOKEN=$1

date

myhostname=`hostname`
externalip=`dig +short myip.opendns.com @resolver1.opendns.com`
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
yum -y install nodejs
npm install -g azure-cli

cd /opt
mkdir tibco
cd tibco

azure storage blob download datasynapsebenchmarkstorage DSEngineLinux64.tar.gz --account-name azbenchmarkstorage --sas "$TOKEN"
tar -xzvf DSEngineLinux64.tar.gz
cd datasynapse/engine

date

./configure.sh -s 10.0.0.4:8000
sudo service firewalld stop
./engine.sh start

date
