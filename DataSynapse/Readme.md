# Simple Cluster with DataSynapse installed

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftanewill%2F5clickTemplates%2Fmaster%2FDataSynapse%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png" />
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Ftanewill%2F5clickTemplates%2Fmaster%2FDataSynapse%2Fazuredeploy.json" target="_blank">
<img src="http://armviz.io/visualizebutton.png"/>
</a>
<br></br>
<b>Quickstart</b>
1) Deploy ARM Template
		a. Click on the link above
		b. Create a resource group with a custom name in a region
		c. Select vm size for the grid manager and for the engines
        	d. Specify the number of engines
		d. Supply the SAS key for the DataSynapse bits
		e. Benchmark model
		
	2) Wait for deployment (may be long if a larger model)
	
	3) Logon to machine IP listed in portal
	
	4) Navigate to /mnt/resource
	
	5) configure VPN
	
	6) Run fluent, t20 is the number of cores you want to run on
		a. time(fluent 3d -g -mpi=intel -pib.dapl -mpiopt="-genv I_MPI_DAPL_PROVIDER=ofa-v2-ib0" -ssh -t20 -cnf=hosts -i runme.jou)


<b>Architecture</b>
