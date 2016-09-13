sudo mkdir /mnt/ANSYS1
sudo mkdir /mnt/ANSYS2
sudo mkdir /mnt/ANSYS3

sudo mount -t iso9660 -o loop /mnt/resource/DOWNLOADS/ANSYS172_LINX64_Disk1.iso/mnt/ANSYS1/
sudo mount -t iso9660 -o loop /mnt/resource/DOWNLOADS/ANSYS172_LINX64_Disk2.iso /mnt/ANSYS2/
sudo mount -t iso9660 -o loop /mnt/resource/DOWNLOADS/ANSYS172_LINX64_Disk3.iso /mnt/ANSYS3/

sudo mkdir -p /mnt/resource/ANSYS_INSTALL
sudo cp -r /mnt/ANSYS*/* /mnt/resource/ANSYS_INSTALL
