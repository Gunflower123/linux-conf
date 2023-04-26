# autowifi
The following bash script was heavily publised [online](http://ict.siit.tu.ac.th/help/iw) and includes dependencies such as:  
* **net-tools** which is a collection of base networking utilities for Linux OS  
* **base=devel** which includes GNU parsers and methods of manipulating binary files  
* **wpa_supplicant** which supports Wi-Fi Protected Access (IEEE 802.1X) for client systems  
* **dhcpcd** which is a Dynamic Host Client Protocol complient script, used to obtain IP addresses and other information from a DHCP server  
   
The script will automatically disconnect and connect to a Local Area Network (LAN) provided the directory `/etc/wpa_supplicant/wpa_supplicant.conf` are regularly maintained. Certificates and public keys are to be kept in `/etc/wpa_supplicant`. 