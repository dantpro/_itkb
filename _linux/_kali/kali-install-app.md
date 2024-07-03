https://cdimage.kali.org/kali-2024.2/kali-linux-2024.2-installer-netinst-amd64.iso  

https://www.kali.org/tools/  

> sudo apt update  
> sudo apt full-upgrade -y  

> sudo apt install kali-desktop-xfce  
> sudo apt install -y xrdp pipewire-module-xrdp  

> #kali-linux-top10  
> #kali-linux-default  


> #sudo apt install locate  
> sudo updatedb  


> sudo apt install -y mc htop  vim

> #sudo apt install openssh-server  

ufw
---

https://sobanmalikk.medium.com/how-to-configure-firewall-with-ufw-in-kali-linux-14ebbf498de2  

>  sudo apt install ufw  

> sudo ufw status  
> sudo ufw default allow outgoing  
> sudo ufw default deny incoming  
> sudo ufw allow ssh  
> sudo ufw allow 2222/tcp  
> sudo ufw limit ssh  
> sudo ufw limit 2222/tcp  
> sudo ufw enable  
> sudo systemctl status ufw.service  
> sudo systemctl status ufw  

---

> sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root  

> sudo apt install nmap ncat ndiff   
> sudo apt install mtr-tiny  
> sudo apt hping3  
> sudo apt install masscan  
> #sudo apt install netcat-traditional  
> sudo apt install wireshark tshark   

c2
---

> sudo apt install -y metasploit-framework   
> sudo apt install havoc  


pwd
---

> sudo apt install hashcat  
> sudo apt install wordlists  

> #sudo apt install hydra-gtk hydra  
> #sudo apt install john  

win/ad
---

> sudo apt install powershell  

> sudo apt install crackmapexec  
> sudo apt install netexec  

> sudo apt install enum4linux  

> sudo apt install impacket-scripts  
> sudo apt install evil-winrm  

> sudo apt install bloodhound  
> #sudo neo4j console  

> sudo apt install nbtscan  
> #sudo apt install smbmap  

proxy
---
> sudo apt install chisel
