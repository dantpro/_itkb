https://habr.com/ru/articles/819729/  
https://itsfoss.com/install-arch-linux/  
https://itsfoss.com/things-to-do-after-installing-arch-linux/  
https://r0ttenbeef.github.io/Custom-Secure-Penetration-Testing-Arch-Linux-Installtion/  

>root@archiso ~ #

KB
---
>
>--- ls /usr/share/kbd/keymaps/**/*.map.gz 
>--- ls /usr/share/kbd/keymaps/**/*.map.gz | grep "ru"  
>--- loadkeys ru  

NET
---
> rfkill  
> rfkill unblock wifi  

> iwctl  
`[iwd]# device list`  
`[iwd]# station wlan0 scan`  
`[iwd]# station wlan0 get-networks`  
`[iwd]# station wlan0 connect AP`  
`[iwd]# station wlan0 show`  

> ip link / ip l  
> ip address / ip a    


HDD
---

>fdisk -l  
>lsblk --scsi  
>lsblk --nvme  
>lsblk  

>dd if=/dev/zero of=/dev/sda status=progress  


>fdisk /dev/sda  

`n 1; t 1 +512M - EFI /dev/sda1`  
`n 2; t 19 +8G - SWAP /dev/sda2`  
`n 3; t 20 ALL - ROOT /dev/sda3` 


> mkfs.fat -F32 /dev/sda1  
> mkswap /dev/sda2  
> swapon /dev/sda2  

> mkfs.ext4 /dev/sda3  


> mount /dev/sda3 /mnt  
> mkdir -p /mnt/boot/efi  
> mount /dev/sda1 /mnt/boot/efi  

Install
---

`# pacstrap /mnt base base-devel linux linux-firmware`  
`# pacstrap /mnt base base-devel linux-lts linux-lts-headers linux-firmware intel-ucode amd-ucode nano`  
`# pacstrap /mnt base base-devel sudo vim`  

> pacstrap /mnt base base-devel linux-lts linux-lts-headers linux-firmware vim   


> genfstab -U /mnt >> /mnt/etc/fstab  

> arch-chroot /mnt  

> ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime  

Locale
---

> echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen  
> echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen  
> locale-gen  

> echo "LANG=en_US.UTF-8" >> /etc/locale.conf  
> echo "#LANG=ru_RU.UTF-8" >> /etc/locale.conf  

> echo "KEYMAP=ru" >> /etc/vconsole.conf  
> echo "FONT=cyr-sun16" >> /etc/vconsole.conf  

---

> echo "xxx-wks-pt-1" > /etc/hostname

> mkinitcpio -p linux-lts  
> mkinitcpio -P  




Boot
---

`#pacman -S grub efibootmgr os-prober`  

> pacman -S grub efibootmgr  
> grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi  
> grub-mkconfig -o /boot/grub/grub.cfg  

Net
---

> pacman -S networkmanager  
> systemctl enable NetworkManager.service  

Root
---

> passwd root  

Reboot
---

> exit  
> umount -R /mnt  
> reboot  


Packages
---


> pacman -Syu  

> pacman -S openssh sudo bash-completion mc htop

`ssh`  
> systemctl status sshd.service  
> systemctl enable sshd.service  
> systemctl start sshd.service  


> useradd -mg users -G wheel pt  
> echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >/etc/sudoers.d/sudoers  
> chmod 440 /etc/sudoers.d/sudoers  

> pacman -S xorg xfce4 xfce4-goodies ightdm lightdm-gtk-greeter-settings gnome-keyring xdg-user-dirs  
> systemctl enable lightdm   
> #systemctl enable xdg-user-dirs  

> sudo pacman -S ttf-liberation ttf-dejavu ttf-droid   
> sudo pacman -S ttf-anonymous-pro ttf-bitstream-vera adobe-source-sans-pro-fonts  

> sudo pacman -S tldr man man-pages  

> sudo pacman -S wget openssh openvpn openssl networkmanager network-manager-applet curl git bash-completion tmux htop inetutils netcat nmap mtr screenfetch    

> sudo pacman -S firefox zip unzip unrar ntfs-3g viewnior evince mpv  

`lib`  
> sudo pacman -S libxcrypt-compat  

`# >sudo pacman -S wget openssh openvpn openssl wpa_supplicant iw wireless_tools networkmanager network-manager-applet curl git bash-completion tmux htop pkgstats gst-plugins-good ttf-liberation ttf-bitstream-vera adobe-source-sans-pro-fonts ttf-droid ttf-dejavu ttf-anonymous-pro inetutils netcat nmap `  

`# >sudo pacman -S  xorg xfce4 xfce4-goodies gvfs gvfs-mtp lightdm lightdm-gtk-greeter-settings light-locker gnome-keyring thunar-archive-plugin thunar-media-tags-plugin thunar-volman ffmpegthumbnailer pavucontrol firefox zip unzip unrar ntfs-3g pulseaudio viewnior evince mpv xdg-user-dirs `  

`# systemctl enable lightdm NetworkManager xdg-user-dirs`  

`# pacman -S lxdm xfce4 xfce4-goodies ttf-liberation ttf-dejavu network-manager-applet ppp pulseaudio-alsa gvfs thunar-volman `  
`# systemctl enable lxdm `  


