**Proxmox - Cluster**

https://pve.proxmox.com/wiki/Cluster_Manager

https://wiki.rtzra.ru/software/proxmox/proxmox-cluster  

*Force remove*

> `systemctl stop pve-cluster corosync`  
> `pmxcfs -l`  
> `rm /etc/corosync/*`  
> `rm /etc/pve/corosync.conf`  
> `killall pmxcfs`  
> `systemctl start pve-cluster`  

