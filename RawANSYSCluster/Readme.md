# Simple deployment of a VM Scale Set of Linux VMs with a jumpbox

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftanewill%2F5clickTemplates%2Fmaster%2FRawANSYSCluster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

This template is designed to assist in the assessment of the ANSYS Fluent CFD package in the Microsoft Azure environment. It automatically downloads and configures Fluent. In addition it authenticates all of the nodes on the cluster and creates a common share directory to be used for each of the nodes. A Virtual Machine Jumpbox is created and a Virtual Machine Scale Set (VMSS) of the same type of machine is created. The VMSS enables easy scaling and quick deployment of the cluster. The Jumpbox serves as the head node. A network card is attached to the Jumpbox and placed in a Virtual Network. The Jumpbox and VMSS reside in the same virtual network. A public IP is assigned to the network with port 22 open. The Jumpbox can be accessed with the following command:

ssh {username}@{vm-private-ip-address}



By default ANSYS Fluent version 17.2 is installed into the /mnt/nfsshare/ directory and the path to the Fluent binary is added to ~.bashrc. To ssh into the jumpbox, you could use the following command:

ssh {username}@{jumpbox-public-ip-address}

To ssh into one of the VMs in the scale set, go to resources.azure.com to find the private IP address of the VM, make sure you are ssh'ed into the jumpbox, then execute the following command:

ssh {username}@{vm-private-ip-address}

PARAMETER RESTRICTIONS
======================

vmssName must be 3-61 characters in length. It should also be globally unique across all of Azure. If it isn't globally unique, it is possible that this template will still deploy properly, but we don't recommend relying on this pseudo-probabilistic behavior.
instanceCount must be 100 or less.
