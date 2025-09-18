# ArchLinux PT Setup
---

https://habr.com/ru/articles/819729/  
https://itsfoss.com/install-arch-linux/  
https://itsfoss.com/things-to-do-after-installing-arch-linux/  
https://r0ttenbeef.github.io/Custom-Secure-Penetration-Testing-Arch-Linux-Installtion/  

> root@archiso ~ #

KB
---

> --- `ls /usr/share/kbd/keymaps/**/*.map.gz`  
> --- `ls /usr/share/kbd/keymaps/**/*.map.gz | grep "ru"`  
> --- `loadkeys ru`  

NET
---

> --- rfkill  
> --- rfkill unblock wifi  

> --- iwctl  
--- `[iwd]# device list`  
--- `[iwd]# station wlan0 scan`  
--- `[iwd]# station wlan0 get-networks`  
--- `[iwd]# station wlan0 connect AP`  
--- `[iwd]# station wlan0 show`  

> ip l  
> ip link  
> ip a  
> ip address  

> ping 1.1.1.1 -c 1  
> ping one.one.one.one -c 1  

UEFI
---

> ls /sys/firmware/efi/efivars  

HDD
---
>
> lsblk  
> --- lsblk --scsi  
> --- lsblk --nvme  

> fdisk -l    
> --- dd if=/dev/zero of=/dev/sda status=progress
  

> fdisk /dev/sda  
`p`  
`g`  
`n ; +512M ; t 1 -> 1  ; EFI /dev/sda1` --- IF EFI  
`n ; +512M ; t 1 -> 4  ; BIOS /dev/sda1` --- IF BIOS      
`n ; +8G ;   t 2 -> 19 ; SWAP /dev/sda2`    
`n ; ALL ;   t 3 -> 20 ; ROOT /dev/sda3`  
`p`  
`w`  

`efi`    
> mkfs.fat -F32 /dev/sda1 --- IF EFI     

`swap`  
> mkswap /dev/sda2  
> swapon /dev/sda2  

`root`  
> mkfs.ext4 /dev/sda3  

> mount /dev/sda3 /mnt  

> mkdir -p /mnt/boot/efi  --- IF EFI  
> mount /dev/sda1 /mnt/boot/efi --- IF EFI
  
Install System Base
---

> --- pacstrap /mnt base base-devel linux linux-headers linux-firmware intel-ucode amd-ucode  
> --- IF HW; Base + Latest Kernel + Headers + Firmware   

> --- pacstrap /mnt base base-devel linux linux-headers    
> --- IF VM; Base + Latest Kernel + Headers    

> --- pacstrap /mnt base base-devel linux-lts linux-lts-headers    
> --- IF VM; Base + LTS Kernel + Headers    
>
> pacstrap /mnt base base-devel linux linux-lts  
> --- IF VM; Base + Latest Kernel + LTS Kernel  

> genfstab -U /mnt >> /mnt/etc/fstab  
> cat /mnt/etc/fstab  

> arch-chroot /mnt  

> --- mkinitcpio -p linux  
> --- mkinitcpio -p linux-lts  
>
> mkinitcpio -P  

Set TZ  
---  
> timedatectl list-timezones | grep Novos  

> ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime  

Set Locale
---

> cat /etc/locale.gen  
> more /etc/locale.gen    
> cp /etc/locale.gen /etc/locale.gen.1  

> echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen  
> echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen  
> locale-gen  

> echo "LANG=en_US.UTF-8" > /etc/locale.conf  
> echo "#LANG=ru_RU.UTF-8" >> /etc/locale.conf  
> cat /etc/locale.conf  

> echo "KEYMAP=ru" >> /etc/vconsole.conf  
> echo "FONT=cyr-sun16" >> /etc/vconsole.conf  
> cat /etc/locale.conf  

Set hostname  
---

> echo "cnt-wks-ptb-1" > /etc/hostname
> cat /etc/hostname  

Setup Boot Manager
---

> --- pacman -S grub efibootmgr os-prober 

> --- pacman -S grub efibootmgr --- IF EFI  
> --- pacman -S grub            --- IF BIOS  

> --- grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --- IF EFI  
> --- grub-install /dev/sda --- IF BIOS  

> pacman -S grub os-prober --noconfirm    
> grub-install /dev/sda  

> grub-mkconfig -o /boot/grub/grub.cfg  

Setup Networking
---

> pacman -S networkmanager --noconfirm    
> systemctl enable NetworkManager.service  

Set root password
---

> passwd root  

Reboot
---

> exit  
> umount -R /mnt  
> reboot  

Setup Remote Management
---

> pacman -Syu  

> pacman -S openssh sudo --noconfirm  

`ssh`  
>
> systemctl status sshd.service  
> systemctl enable sshd.service  
> systemctl start sshd.service  

> useradd -m -g users -G wheel -s /bin/bash username

> passwd username

`sudo`  
> echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >/etc/sudoers.d/sudoers  
> chmod 440 /etc/sudoers.d/sudoers  

Install system pkgs
---

> sudo pacman -Syu  
> sudo pacman -S man man-pages tldr --noconfirm   
> sudo pacman -S bash-completion nano vim mc zip unzip unrar tmux screen htop screenfetch ncdu ntfs-3g pkgstats --noconfirm  

`wifi`
> --- sudo pacman -S wpa_supplicant iw wireless_tools  

Install system libs  
---
> sudo pacman -S libxcrypt-compat --noconfirm    

Install networking tools
---

> sudo pacman -S openssh openvpn openssl ppp curl wget git inetutils netcat nmap mtr fping hping --noconfirm  

Xwin
---

`xorg base`
> sudo pacman -S xorg xorg-xinit xorg-xclock xorg-twm xterm  --noconfirm  
> --- sudo pacman -S rxvt-unicode  --noconfirm  
> startx  

`fonts`  
> sudo pacman -S ttf-liberation ttf-dejavu ttf-droid --noconfirm     
> --- sudo pacman -S ttf-anonymous-pro ttf-bitstream-vera adobe-source-sans-pro-fonts --noconfirm    

`i3`  
> --- sudo pacman -S i3-wm  
> --- echo "exec i3" >> ~/.xinitrc  

`xfce`  
> sudo pacman -S xfce4 xfce4-goodies --noconfirm
> 
> sudo pacman -S thunar-volman thunar-archive-plugin thunar-media-tags-plugin  

`xdm`  
> sudo pacman -S lightdm lightdm-gtk-greeter-settings  --noconfirm
> sudo systemctl enable lightdm     

> --- sudo pacman -S lxdm --noconfirm  
> --- sudo systemctl enable lxdm
 
`xnet`
> sudo pacman -S networkmanager network-manager-applet --noconfirm 

`xdg`
> sudo pacman -S xdg-user-dirs --noconfirm  
> xdg-user-dirs-update

`g-app`
> sudo pacman -S gnome-keyring  
> --- sudo pacman -S gvfs gvfs-mtp  --noconfirm  

`x-app`
> --- sudo pacman -S light-locker --noconfirm  

`view-app`
> --- sudo pacman -S viewnior evince --noconfirm   

`video-app`  
> --- sudo pacman -S mpv ffmpegthumbnailer gst-plugins-good --noconfirm    

`audio-app`
> --- sudo pacman -S pavucontrol pulseaudio pulseaudio-alsa --noconfirm  

`internet`  
> sudo pacman -S firefox --noconfirm      
> --- sudo pacman -S thunderbird --noconfirm  

