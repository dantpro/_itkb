**Proxmox - ZFS**  

https://pve.proxmox.com/wiki/ZFS_on_Linux

> `cat /etc/pve/storage.cfg`  

> `zpool status`   

> `zfs list`  
> `zfs get used,referenced,volsize,compressratio pool-vmd/vm-1-disk-1`    
> `zfs get all pool-vmd/vm-1-disk-1`  

> `zpool create -f -o ashift=12 vmd mirror /dev/sda /dev/sdc mirror /dev/sdb /dev/sdd`  
> `zpool status`  
> `zfs list`  

> `zfs get compression vmd`  
> `zfs set compression=lz4 vmd`  
> `zfs get compression vmd`


![image](https://github.com/user-attachments/assets/7ddd8dec-840e-405b-a965-e04b99531880)

---



