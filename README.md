# Artix Linux Configurations
Self-contained config files for back-up and continuous development for a Artix computer running dinit initialisation system, alongside a URxvt Tiling window-manager and VIM-based scripts. 

## Usage
## linux-conf  
Base Artix installation with dinit system  
`<Program> > /dev/null 2>&1 &`

Safe mounting/dismounting
```
mount --types proc /proc /mnt/proc  
mount --rbind /sys /mnt/gentoo/sys  
mount --make-rslave /mnt/gentoo/sys  
mount --rbind /dev /mnt/gentoo/dev  
mount --make-rslave /mnt/gentoo/dev  
mount --bind /run /mnt/gentoo/run  
mount --make-slave /mnt/gentoo/run  
```

## Programs:
opencv  
matlab  
brave  

## Required packages:  
pulseaudio 16.1-1  

Containing multiple config files for Linux programs

# Xresouces
https://github.com/marcuskrahl/urxvt-config/blob/master/Xresources  
https://gist.github.com/liangzan/1643690  

Other resources  
https://www.askapache.com/linux/rxvt-xresources/  
