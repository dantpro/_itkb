**Import Hyper-V VM to Proxmox**  

> `moount -t cifs -o username=<user>,domain=<domain.dom> //srv-dom-hvt-1/hvm  /mnt/smb/`  
> `qm disk import 100 /mnt/smb/vhd/<file-name>.vhdx <vmd-storage-name>`  
                                                             
---

**Export Proxmox backup to Hyper-V**

> `zstd -d ./vzdump-qemu-100-2025_02_10-17_11_26.vma.zst`  
> `vma extract ./vzdump-qemu-100-2025_02_10-17_11_26.vma ./vmadata`  
>
> `cd ./raw`    
> `qemu-img convert -p -f raw -O vhdx ./vmadata/disk-drive-scsi0.raw  ./vmadata/disk-drive-scsi0.vhdx`
  

---


