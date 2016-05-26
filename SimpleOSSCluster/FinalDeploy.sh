#!/bin/bash
mkdir -p /home/azureuser/bin/
cd /home/azureuser/bin

#download utilites and the HeadComputeNodeDeploy script
#wget https://raw.githubusercontent.com/Noesis-Support/5clickTemplates/SurfCluster/SimpleOSSCluster/HeadComputeNodeDeploy.sh
#wget https://raw.githubusercontent.com/Noesis-Support/utils/master/authMe.sh
#wget https://raw.githubusercontent.com/Noesis-Support/utils/master/myClusRun.sh
wget https://aka.ms/ubuntuopenfoam_nonhpc
tar -xzf ubuntuopenfoam_nonhpc -C /opt
runuser -l azureuser -c "bin/myClusRun.sh 'echo \"source /opt/openfoam30/etc/bashrc\">>.bashrc'"
#chmod +x *

#Run HeadComputeNodeDeploy script
#runuser -l root -c '/home/azureuser/bin/HeadComputeNodeDeploy.sh'
