#!/bin/bash
add-apt-repository http://dl.openfoam.org/ubuntu
sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
apt-get update
apt-get -y install openfoam4
