# Artix Linux Configurations
Self-contained config files for back-up and continuous development for a Artix computer running dinit initialisation system, alongside an i3 Tiling window-manager, URxvt terminal emulator and VIM-based scripts.

## Usage
## linux-conf  
The current arrangement signs-in without automatically setting up an Xorg server due to the necessity to debug if crashes occur. Additional packages must be installed such as,
* **xorg-xwininfo** which is used to configure window information utility for X servers


i3-gaps: https://github.com/mathisen99/i3-gaps/blob/master/config  
More: https://github.com/sarve-sh/i3wm-nord/blob/main/i3/config  
Missing firmware for Intel DSP Codec: https://github.com/thesofproject/sof-bin/

## Programs:
opencv  
matlab  
brave  

## Required packages:  
pulseaudio 16.1-1  

## Additional commands
The following sends redirects output and error messages to `/dev/null`, whilst putting the process in the background:  
```
<Program> > /dev/null 2>&1 &
```

The following set of code safely mounts a USB-stick, enters it with `chroot` and provides system wide environment, and script start-up:  
```
mount --types proc /proc /mnt/usbstick/proc  
mount --rbind /sys /mnt/usbstick/sys  
mount --make-rslave /mnt/usbstick/sys  
mount --rbind /dev /mnt/usbstick/dev  
mount --make-rslave /mnt/usbstick/dev  
mount --bind /run /mnt/usbstick/run  
mount --make-slave /mnt/usbstick/run  

chroot /mnt/usbstick /bin/bash
source /etc/profile
```
# Xresouces
https://github.com/marcuskrahl/urxvt-config/blob/master/Xresources  
https://gist.github.com/liangzan/1643690  

Other resources  
https://www.askapache.com/linux/rxvt-xresources/  
