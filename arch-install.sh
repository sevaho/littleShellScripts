#!/bin/bash

#Author: Sebastiaan Van Hoecke

#functions
runAsRoot(){
  if [[ $UID != 0 ]]; then
    echo "run as root"
    exit 0
  fi
}
packages(){
  #Desktop
  pacman -S --noconfirm i3-wm i3 compton conky lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings shadow arc-icon-theme arc-solid-gtk-theme
  #Terminal
  pacman -S --noconfirm vim zsh tmux termite
  #Programming
  pacman -S --noconfirm docker npm python ansible vagrant php git tree nodejs ruby jre8-openjdk shellcheck js
  #Apps
  pacman -S --noconfirm tlp gtk3 evince geary w3m mpv htop youtube-dl mclocate scrot shotwell transmission-gtk ack wget curl lm_sensors gparted pcmanfm screenfetch hardinfo lsb-release galculator dconf-editor dconf dmidecode filezilla
  #Network
  pacman -S --noconfirm networkmanager network-manager-applet nmap wireshark-gtk firewalld iftop
  #AUR managers
  pacman -S --noconfirm yaourt
  #gstreamer
  pacman -S --noconfirm gstreamer gst-plugins-base gst-plugins-bad gst-plugins-good gst-plugins-ugly
  #Compression
  pacman -S --noconfirm zip unzip unrar unace 
  #Other
  pacman -S --noconfirm dkms exfat-utils
  #pacman -S --noconfirm 

}
git(){
  git config --global user.name "sevaho"
  git config --global user.email "sebastiaan.vanhoecke@hotmail.be"
}
aurPackages(){
  yaourt -S google-chrome i3blocks packer spotify vivaldi
}
firewalldSettings(){
  systemctl enable lightdm
  systemctl enable firewalld
  systemctl enable docker
  systemctl enable NetworkManager
}

main(){
  runAsRoot
  pacman -Syu
  packages
  aurPackages
  git
  firewalldSettings
}

main "${@}"

