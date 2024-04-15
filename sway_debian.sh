#!/bin/sh


echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
echo "Press ENTER to continue."
read cont

#checking and applying updates
sudo apt update && sudo apt upgrade -y

#installing packages
sudo apt install swaylock zsh file-roller evince flatpak cbatticon network-manager network-manager-gnome network-manager-openconnect-gnome eom network-manager-openconnect lxappearance git lf neovim fonts-jetbrains-mono firefox-esr tlp alacritty kitty brightnessctl pulsemixer sway wofi waybar fonts-material-design-icons-iconfont fonts-font-awesome xwayland libglib2.0-bin fonts-noto-color-emoji wlr-randr nala wl-clipboard mpv swayidle papirus-icon-theme gnome-themes-extra pulseaudio arc-theme libnotify-bin mako-notifier acpi-support acpid acpi linux-cpupower cpufrequtils openssh-server nnn fzf &&

#copying scripts to .local/bin

# create Pictures and screenshot dir if not existent
ls $HOME/Pictures/screenshots/ || mkdir -p $HOME/Pictures/screenshots

ls $HOME/.local/bin || mkdir -p $HOME/.local/bin/ #make directory if .local/bin does not exist
mkdir $HOME/.trash

# Make .config directory if it does not exist.
ls $HOME/.config/ || mkdir $HOME/.config/

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
echo -e "\033[0;32m enabling systemd services \033[0m"
sudo systemctl enable tlp
sudo systemctl enable ssh.service
sudo systemctl set-default graphical.target

#shell configuration

case "$SHELL" in
    *"bash"*)
	echo -e "\033[0;32m Found SHELL: bash \033[0m"
	cp cfg_files/shell/bash/bash_aliases $HOME/.bash_aliases
	cp cfg_files/shell/bash/bashrc  $HOME/.bashrc
	cp cfg_files/shell/bash/profile  $HOME/.bash_profile
	echo '[ "$(tty)" = "/dev/tty1" ] && exec sway' >> $HOME/.bash_profile
	;;
    *"zsh"*)
	echo -e "\033[0;32m Found SHELL: zsh \033[0m"
	cp $HOME/Jazzian/cfg_files/shell/zsh/zshrc $HOME/.zshrc
	cp $HOME/Jazzian/cfg_files/shell/zsh/zshenv $HOME/.zshenv
	cp $HOME/Jazzian/cfg_files/shell/zsh/zprofile $HOME/.zprofile
	cp $HOME/Jazzian/cfg_files/shell/zsh/zcompdump $HOME/.zcompdump
	echo '[ "$(tty)" = "/dev/tty1" ] && exec sway' >> $HOME/.zprofile
	;;
esac
