#!/bin/sh

sudo dnf update && 
sudo dnf install hyprland swaybg kitty swayidle zsh swaylock pinentry-gtk pinentry \
thunar polkit-gnome nnn neovim waybar alacritty mpv firefox zathura zathura-pdf-poppler evince git pulseaudio-utils pipewire-utils file-roller \
NetworkManager-openconnect-gnome wofi brightnessctl gsettings-desktop-schemas wl-clipboard papirus-icon-theme NetworkManager-tui eom tlp \
libnotify mako swaybg google-noto-color-emoji-fonts qalculate-gtk fzf 


ls $HOME/.local/bin || mkdir -p $HOME/.local/bin/ #make directory if .local/bin does not exist

mkdir $HOME/.trash/

# create Pictures and screenshot dir if not existent
ls $HOME/Pictures/screenshots/ || mkdir -p $HOME/Pictures/screenshots

#copying scripts to .local/bin/
echo -e "\033[0;32m copying scipts to '~/.local/bin/ \033[0m"
cp -r $HOME/Jazzian/bin/Wayland/* $HOME/.local/bin/
#copying config files
#cp -r cfg_files/alacritty/ $HOME/.config/alacritty/
#cp -r cfg_files/wofi/ $HOME/.config/
#cp -r cfg_files/hypr/ $HOME/.config/
#cp -r cfg_files/nvim/ $HOME/.config/
#cp -r cfg_files/mako/ $HOME/.config/ 
#cp -r cfg_files/nnn/ $HOME/.config/ 
echo -e "\033[0;32m copying config files...\033[0m "
( ls $HOME/.config/ || mkdir $HOME/.config/
cp -r cfg_files/* $HOME/.config/
cp -r cfg_files/waybar/Hyprland/waybar/ $HOME/.config/ ) && echo -e "\033[0;32m copied config files \033[0m"

#systemd
echo -e "\033[0;32m enabling systemd services \033[0m"
sudo systemctl enable tlp
sudo systemctl set-default graphical.target

# bashrc
#if [ "$SHELL" = "/bin/bash" ];
#then
#	echo 'export WLR_NO_HARDWARE_CURSORS=1' >> $HOME/.bash_profile
#	echo '[ "$(tty)" = "/dev/tty1" ] && exec Hyprland' >> $HOME/.bash_profile
#        echo '# Aliases' >> $HOME/.bashrc
#	echo 'alias "sn"="sudo dnf"' >> $HOME/.$(echo $SHELL | awk -F '/' '{print $3}')rc
#	echo 'alias "n"="dnf"' >> $HOME/.$(echo $SHELL | awk -F '/' '{print $3}')rc
#	cat ./cfg_files/shell/bashrc >> $HOME/.bashrc
#fi

case "$SHELL" in
    *"bash"*)
	echo -e "\033[0;32m Found SHELL: bash \033[0m"
	cp cfg_files/shell/bash/bash_aliases $HOME/.bash_aliases
	cp cfg_files/shell/bash/bashrc  $HOME/.bashrc
	cp cfg_files/shell/bash/profile  $HOME/.bash_profile
	echo '[ "$(tty)" = "/dev/tty1" ] && exec Hyprland' >> $HOME/.bash_profile
	;;
    *"zsh"*)
	echo -e "\033[0;32m Found SHELL: zsh \033[0m"
	cp $HOME/Jazzian/cfg_files/shell/zsh/zshrc $HOME/.zshrc
	cp $HOME/Jazzian/cfg_files/shell/zsh/zshenv $HOME/.zshenv
	cp $HOME/Jazzian/cfg_files/shell/zsh/zprofile $HOME/.zprofile
	cp $HOME/Jazzian/cfg_files/shell/zsh/zcompdump $HOME/.zcompdump
	echo '[ "$(tty)" = "/dev/tty1" ] && exec Hyprland' >> $HOME/.zprofile
	;;
esac
