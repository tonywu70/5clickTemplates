#!/bin/bash
mkdir -p /home/azureuser/bin/
cd /home/azureuser/bin

#download utilites and the HeadComputeNodeDeploy script
wget https://raw.githubusercontent.com/tanewill/5clickTemplates/SurfCluster/SimpleOSSCluster/HeadComputeNodeDeploy.sh
wget https://raw.githubusercontent.com/tanewill/utils/master/authMe.sh
wget https://raw.githubusercontent.com/tanewill/utils/master/myClusRun.sh
chmod +x *

#Run HeadComputeNodeDeploy script
runuser -l root -c '/home/azureuser/bin/HeadComputeNodeDeploy.sh'
