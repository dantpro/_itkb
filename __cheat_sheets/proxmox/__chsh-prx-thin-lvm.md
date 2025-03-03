**Create/Delete lvm thin pool**  

https://pve.proxmox.com/wiki/Storage:_LVM_Thin  

https://pve.proxmox.com/wiki/Logical_Volume_Manager_(LVM)  


> `sgdisk -N 1 /dev/sda`  
> `pvcreate --metadatasize 250k -y -ff /dev/sda1`  
> `pvs`  

> `vgcreate vg-vmd /dev/sda1`  
> `lvcreate -n lv-vmd -l 99%FREE vg-vmd`  
> `lvconvert --type thin-pool vg-vmd/lv-vmd`  
> `lvs`  
> `pvesm lvmthinscan vg-vmd`  

> `lvremove /dev/vg-vmd/lv-vmd`  
> `vgremove vg-vmd`  

> `wipefs --all /dev/sda`  
> `parted /dev/sda mklabel gpt`  

---
![image](https://github.com/user-attachments/assets/31f28b5b-0844-41a2-abd0-d61efb532ed1)  
---

**Get info**  

> `pvs`  
> `lvs`  
> `lvdisplay`  
> `lvdisplay vg-vmd/vm-1-disk-1`  
