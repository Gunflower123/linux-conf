## Shell Scripts

1. `autowifi.sh` enables internet connections using a network interface as an argument. Example usage `./autowifi.sh wlan0`. Bug remains: retriving the SSID and PPID from the connected network retrieves for ALL and as such, the PCRE (PERL-Compatible Regular Expression) needs updating!
  
The following bash script requires packages such as:  
* **net-tools** which is a collection of base networking utilities for Linux OS  
* **base=devel** which includes GNU parsers and methods of manipulating binary files  
* **wpa_supplicant** which supports Wi-Fi Protected Access (IEEE 802.1X) for client systems  
* **dhcpcd** which is a Dynamic Host Client Protocol complient script, used to obtain IP addresses and other information from a DHCP server  
   
The script will not run automatically at start-up and requires sudo priviledges when executing, it will disconnect and connect to a Local Area Network (LAN) provided the directory `/etc/wpa_supplicant/wpa_supplicant.conf` are regularly maintained. Certificates and public keys are to be kept in `/etc/wpa_supplicant`.  
  
2. `brightness.sh` uses `xrandr` to change screen brightness from a range of 0.1 to 1.0. Example usage `./brightness.sh up 0.1`. This script requires 2 arguments: direction (up/down) and a value (increment). This Shell script is used in keybinding F5/F6 brightness keys within i3 config.

The following bash script requires only base Linux packages for a minimal install. Additional packages:
* **xbacklight** which is a RandR-based backlight control application  
* **light** which is a backlight-controller application

3. `setbg`  

4.  `dmenu-wiki`  
