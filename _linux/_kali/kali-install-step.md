https://www.kali.org/docs/troubleshooting/common-minimum-setup/  
https://www.kali.org/docs/installation/mini-iso/  
https://www.kali.org/docs/introduction/what-image-to-download/  

https://cdimage.kali.org/kali-2024.2/kali-linux-2024.2-installer-netinst-amd64.iso  

> kali-tweaks  

>touch ~/.hushlogin  

>sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root  

>sudo apt install -y kali-root-login  
>sudo passwd root  


>sudo systemctl status ssh
>sudo systemctl start ssh
>sudo systemctl enable ssh
>sudo systemctl disable ssh


locale
---

https://miloserdov.org/?p=5878  

> locale  
> locale -a  

> vi /etc/locale.gen  
> sudo locale-gen  

```
# ~/.bashrc file
#
# Set English locale
export LANG=en_US.UTF-8
# 
# Set the Russian locale
#export LANG=ru_RU.UTF-8
```

> sudo localectl set-locale LANG=en_US.UTF-8  
> sudo localectl set-locale LANG=ru_RU.UTF-8  

> echo 'en_US' > ~/.config/user-dirs.locale  
> xdg-user-dirs-gtk-update  

time
---

> sudo apt remove ntp  
> timedatectl  

> timedatectl list-timezones |grep Novosibirsk  
> sudo timedatectl set-timezone Asia/Novosibirsk  
> sudo timedatectl set-ntp on  
> timedatectl  



