https://www.kali.org/docs/virtualization/install-hyper-v-guest-enhanced-session-mode/

> Get-VM -Name _vm_kali -fl *  
> Set-VM -Name _vm_kali -EnhancedSessionTransportType HVSocket  
> #Set-VM -Name _vm_kali -EnhancedSessionTransportType VMBus  

> sudo apt install xrdp pipewire-module-xrdp  
> sudo /usr/lib/kali_tweaks/helpers/hyperv-enhanced-mode enable  

> sudo systemctl start xrdp  
> sudo systemctl enable xrdp  

