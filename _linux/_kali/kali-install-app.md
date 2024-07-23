https://cdimage.kali.org/kali-2024.2/kali-linux-2024.2-installer-netinst-amd64.iso

https://www.kali.org/tools/

https://www.kali.org/docs/general-use/metapackages/

> sudo apt update  
> sudo apt full-upgrade  

> sudo apt install kali-desktop-xfce  
> sudo apt install xrdp pipewire-module-xrdp  

> #sudo apt install kali-linux-top10  
> #sudo apt install kali-linux-default  


> #sudo apt install locate  
> sudo updatedb  

> sudo apt install mc htop vim  

> sudo apt install plank  

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

root
---

> sudo apt install kali-grant-root && sudo dpkg-reconfigure kali-grant-root  
> sudo apt install kali-root-login  

net
---

> sudo apt install nmap ncat ndiff   
> sudo apt install mtr-tiny  
> sudo apt install hping3  
> sudo apt install dnsutils  
> sudo apt install masscan  
> #sudo apt install netcat-traditional  
> sudo apt install wireshark tshark   
> sudo apt install kerbrute  
> sudo apt install responder  

> sudo apt install python3-pip  
> sudo apt install pipx  

> sudo apt install tmux  
> sudo apt install ufw  
> sudo apt install ncdu  

> sudo apt install neofetch screenfetch  

c2
---

> sudo apt install metasploit-framework   
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

net
---
> sudo apt install openvpn

---

https://pipx.pypa.io/stable/  
> sudo apt install pipx git  
> pipx ensurepath  
> sudo pipx ensurepath --global # optional to allow pipx actions with --global argument  

https://github.com/login-securite/DonPAPI  
> `pipx install git+https://github.com/login-securite/DonPAPI.git`

https://github.com/Pennyw0rth/NetExec  
> `pipx install git+https://github.com/Pennyw0rth/NetExec`  

