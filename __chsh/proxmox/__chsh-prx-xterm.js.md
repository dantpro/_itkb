https://gist.github.com/xmesaj2/3ea1c35b5215d34a7c9e182c7486653f  
https://gist.github.com/yuna0x0/7fdd61ea9ed9aba68e2dd02f6ff4814a  

https://pve.proxmox.com/wiki/Serial_Terminal  
https://lin.ekzorchik.ru/2019/09/19/how-to-use-xterm-js-for-vm-in-proxmox-6/  


---

1. Add a virtual serial port to the VM using PVE Web GUI and restart the VM
2. Enable and start the virtual serial port on VM, change tty number as needed (Reference: https://askubuntu.com/a/621209/838946)

> `sudo systemctl enable serial-getty@ttyS0.service`  
> `sudo systemctl start serial-getty@ttyS0.service`  

3. Done! You can now select xterm.js in the PVE Web GUI


---


