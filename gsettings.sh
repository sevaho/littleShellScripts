#!/bin/bash

#Author: Sebastiaan Van Hoecke

terminal=$1

main(){
  check_args "${@}"
  set_gsettings
}

set_gsettings(){
  #dconf settings

  gsettings set org.gnome.settings-daemon.plugins.keyboard active false
  gsettings set org.gnome.desktop.input-sources sources "[('xkb','be')]"

  gsettings set org.gnome.settings-daemon.plugins.power idle-dim "false"

  gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['Page_Down']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['Page_Up']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super>Page_Up']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super>Page_Down']"

  #CTR ALT T TERMINAL
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "TerminalShortCut"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "$terminal -e 'tmux'"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Control><Alt>T"
  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

  gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

  gsettings set org.gnome.desktop.wm.preferences button-layout "'close,minimize,maximize:appmenu'"

  gsettings set org.gnome.Terminal.Legacy.Settings theme-variant "dark"

  gsettings set org.gnome.nautilus.preferences default-sort-order "'type'"

  gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down "'<Super>KP_Subtract'"
  gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "'<Super>KP_Add'"

  gsettings set org.gnome.desktop.interface show-battery-percentage true

  gsettings set org.gnome.desktop.interface clock-show-date "true"
  
  gsettings set org.gnome.desktop.datetime automatic-timezone true
}
check_args(){
if [ "${#}" -ne "1"  ]; then
  echo "Expected 1 argument(s), got ${#}" >&2
  echo "enter your terminal"
  echo ""
  echo "For example: gnome-terminal"
  exit 2
fi
}

main "${@}"

