#! /usr/bin/bash
#########################
#     MAIN PROGRAMS     #
#########################
#!/bin/bash

#INIT

#INSTALLS

dnf -y update

#rpm
#mp3 codecs
dnf -y install vlc ffmpeg gstreamer python
#
dnf -y install brasero gparted dconf-editor filezilla nano vim gimp gnome-tweak-tool
#compression
dnf -y install ark cabextract lzip p7zip zip unzip p7zip-plugins
#LAP
dnf -y install httpd php
#programming networking
dnf -y install git nmap vagrant ansible gcc wireshark wireshark-gnome ack
#terminal commands
dnf -y install htop tree youtube-dl
#Docker
curl -fsSL https://get.docker.com/ | sh
#preload
su -c 'yum -y install preload'
#other
dnf -y install rdesktop lshw-gui iftop iptraf 

dnf -y update

#themes and looks

echo "install arc, numix, shadow and paper "


#selinux
dnf -y install setroubleshoot
setsebool -P httpd_can_network_connect=1
setsebool -P httpd_read_user_content=1
setsebool -P httpd_unified=1
setsebool -P httpd_execmem=1
setsebool -P httpd_sys_script_anon_write=1


#firewall
systemctl restart firewalld.service
firewall-cmd --add-service=http
firewall-cmd --add-port=80/tcp
firewall-cmd --reload

#services
systemctl start httpd.service
systemctl enable docker
systemctl start docker

#commands
sed -i -e 's/upload_max_filesize = 2M/upload_max_filesize = 20M/g' /etc/php.ini

#github
git config --global user.name "sevaho"
git config --global user.email "sebastiaan.vanhoecke@hotmail.be"


echo "Install gnome shell extensions"
echo "Install virtualbox"
