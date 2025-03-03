https://cdimage.kali.org/kali-2024.2/kali-linux-2024.2-installer-netinst-amd64.iso

https://www.kali.org/tools/

https://www.kali.org/docs/general-use/metapackages/

> sudo apt update  
> sudo apt full-upgrade  

> sudo apt install kali-desktop-xfce  
> #sudo apt install xfce4-goodies  
> #sudo apt install xorg lightdm xfce4 xfce4-places-plugin xfce4-goodies  
> sudo apt install xrdp pipewire-module-xrdp  

> #sudo apt install kali-linux-top10  
> #sudo apt install kali-linux-default  


> #sudo apt install locate  
> sudo updatedb  

> sudo apt install mc htop vim  

> sudo apt install plank  

> #sudo apt install openssh-server  

> sudo apt install unattended-upgrades  
> sudo apt install apt-listchanges  
> sudo apt install bsd-mailx  

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

> sudo apt install ncat ndiff 
> sudo  apt install nmap zenmap  
> sudo apt install mtr-tiny  
> sudo apt install hping3  
> sudo apt install dnsutils  
> sudo apt install masscan  
> #sudo apt install netcat-traditional  
> sudo apt install wireshark tshark   
> sudo apt install kerbrute  
> sudo apt install responder  

> sudo apt install python3  
> sudo apt install python-is-python3  
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

> sudo apt install hydra

> #sudo apt install hydra-gtk  
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
> sudo apt install bloodhound.py
  
> #sudo neo4j console  

https://github.com/CravateRouge/autobloody
> sudo apt install libkrb5-dev

> pip install autobloody


> sudo apt install nbtscan  
> #sudo apt install smbmap  

proxy
---
> sudo apt install chisel  
> sudo apt install proxychains4
> sudo apt install ligolo-ng

net
---
> sudo apt install openvpn

www
---

> sudo apt install links lynx


office
---

> sudo apt install libreoffice libreoffice-gtk4  

> sudo apt install libimage-exiftool-perl  

---

> sudo apt install dos2unix  
> sudo apt install mitmproxy  

> sudo apt install xclip

> sudo apt install openjdk-17-jdk

> sudo apt install systemd-resolved

> sudo apt install jq

> sudo apt install keepassxc  

> sudo apt install coercer  

> sudo apt install remmina  
> sudo apt install freerdp2-x11  
> sudo apt install rdesktop  

> sudo apt install goshs  
> sudo apt install gsocket  

> sudo apt install mxcheck

> sudo apt install sprayhound

> sudo apt install sqlmc
  
---

https://github.com/Pennyw0rth/NetExec  
> `pipx install git+https://github.com/Pennyw0rth/NetExec`  

https://www.kali.org/tools/netexec/
> sudo apt install netexec

https://www.kali.org/tools/hekatomb/
> sudo apt install hekatomb

https://www.kali.org/tools/netscanner/
> sudo apt install netscanner

> sudo apt install zmap

https://github.com/OWASP/joomscan
> sudo apt install joomscan

> sudo apt install enum4linux-ng

https://pipx.pypa.io/stable/  
> sudo apt install pipx git  
> pipx ensurepath  
> sudo pipx ensurepath --global # optional to allow pipx actions with --global argument  

https://github.com/login-securite/DonPAPI  
> `pipx install git+https://github.com/login-securite/DonPAPI.git`

> `pipx install pypykatz`  

> sudo apt install wpscan  
> sudo apt install joomscan  

> sudo apt install whatweb  
> # sudo apt install wapiti  

https://book.hacktricks.xyz/network-services-pentesting/pentesting-web
https://github.com/ShielderSec/webtech
> `pip install webtech`  

https://github.com/ly4k/Certipy
> `pip3 install certipy-ad`

https://github.com/aniqfakhrul/powerview.py
> sudo apt install libkrb5-dev  
> pip3 install powerview

> sudo apt install bloodyad  
> sudo apt install certi  

