# linux-conf  
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

# Programs:
opencv  
matlab  
brave  

# Required packages:  
pulseaudio 16.1-1  

Containing multiple config files for Linux programs
