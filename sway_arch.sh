#!/bin/sh


echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
echo "Press ENTER to continue."
read cont

sudo pacman -S fzf zsh nnn kitty networkmanager  nm-connection-editor neovim sway waybar wofi zathura-pdf-poppler zathura evince webkit2gtk-4.1 networkmanager-openconnect firefox lf tlp alacritty pulseaudio pulsemixer waybar mpv gsettings-desktop-schemas nerd-fonts swayidle swaylock openconnect lxappearance wl-clipboard file-roller papirus-icon-theme gnome-themes-extra arc-gtk-theme

#copying scripts to .local/bin
ls $HOME/.local/bin || mkdir -p $HOME/.local/bin/ #make directory if .local/bin does not exist
mkdir $HOME/.trash


# create Pictures and screenshot dir if not existent
ls $HOME/Pictures/screenshots/ || mkdir -p $HOME/Pictures/screenshots

# Ask user whether to copy or link configs and scripts.
echo "[C]opy or [L]ink the config files and scripts?"
read choice

case "$choice" in
    'c'|'C')
	echo -e "\033[0;32m copying config files...\033[0m "
	cp -r cfg_files/alacritty $HOME/.config/
	cp -r cfg_files/kitty $HOME/.config/
	cp -r cfg_files/lf $HOME/.config/
	cp -r cfg_files/mako $HOME/.config/
	cp -r cfg_files/nnn $HOME/.config/
	cp -r cfg_files/nvim.back $HOME/.config/
	cp -r cfg_files/sway $HOME/.config/
	cp -r cfg_files/tmux $HOME/.config/
	cp -r cfg_files/vifm $HOME/.config/
	cp -r cfg_files/waybar $HOME/.config/
	cp -r cfg_files/wofi $HOME/.config/
	cp -r cfg_files/zathura $HOME/.config/
	echo "Press ENTER to continue."
	read cont
	echo -e "\033[0;32m copying scipts to '~/.local/bin/ \033[0m"

	echo "Press ENTER to continue."
	cp -r bin/* $HOME/.local/bin/
	read cont
	;;
    'l'|'L')
	echo -e "\033[0;32m creating sym-links...\033[0m "
	ln -s $HOME/Jazzian/cfg_files/alacritty $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/kitty $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/lf $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/mako $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/nnn $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/nvim.back $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/sway $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/tmux $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/vifm $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/waybar $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/wofi $HOME/.config/
	ln -s $HOME/Jazzian/cfg_files/zathura $HOME/.config/
	echo "Press ENTER to continue."
	read cont

	echo -e "\033[0;32m linking scipts to '~/.local/bin/ \033[0m"
	ln -s $HOME/Jazzian/bin/* $HOME/.local/bin/

	echo "Press ENTER to continue."
	read cont
	;;
esac



#systemd
echo "enabling systemd services"
sudo systemctl enable tlp


#shell configuration

case "$SHELL" in
    *"bash"*)
	echo "Found SHELL: bash"
	cp cfg_files/shell/bash/bash_aliases $HOME/.bash_aliases
	cp cfg_files/shell/bash/bashrc  $HOME/.bashrc
	cp cfg_files/shell/bash/profile  $HOME/.bash_profile
	sed -i ""$(awk '/source/ {print FNR}' $HOME/.bashrc)" d" $HOME/.bashrc
	echo '[ "$(tty)" = "/dev/tty1" ] && exec sway' >> $HOME/.bash_profile
	;;
    *"zsh"*)
	echo "Found SHELL: zsh"
	cp $HOME/Jazzian/cfg_files/shell/zsh/zshrc $HOME/.zshrc
	cp $HOME/Jazzian/cfg_files/shell/zsh/zshenv $HOME/.zshenv
	cp $HOME/Jazzian/cfg_files/shell/zsh/zprofile $HOME/.zprofile
	cp $HOME/Jazzian/cfg_files/shell/zsh/zcompdump $HOME/.zcompdump
	;;
esac


