#!/bin/sh

# Hello there fellow traveler. (just kidding) This script is propetually work-in-progress. So if for some reason you decide to 
# Run or inspect this script and have suggestions to improve this script. Feel free to let me know.


## Determine what distro is running 

release="$(cat /etc/*-release)"

echo -e "\033[0;32m Determining Distro ... \033[0m "


case $release in
    *Debian* | *debian* | *DEBIAN*) echo -e "\033[0;32m Found Debian.\033[0m "
        distro="Debian"

        echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
        echo "Press ENTER to continue."
        read cont

        ### Checking and applying updates 
        sudo apt update && sudo apt upgrade -y

        ### Installing packages 
        sudo apt install tmux swaylock zsh file-roller evince flatpak cbatticon network-manager network-manager-gnome network-manager-openconnect-gnome eom network-manager-openconnect lxappearance git lf neovim fonts-jetbrains-mono firefox-esr tlp alacritty kitty brightnessctl pulsemixer sway wofi waybar fonts-material-design-icons-iconfont fonts-font-awesome xwayland libglib2.0-bin fonts-noto-color-emoji wlr-randr nala wl-clipboard mpv swayidle papirus-icon-theme gnome-themes-extra pulseaudio arc-theme libnotify-bin mako-notifier acpi-support acpid acpi linux-cpupower cpufrequtils openssh-server nnn fzf
        ;;
    *Fedora* | *FEDORA* | *fedora*) echo -e "\033[0;32m Found Fedora.\033[0m"
        distro="Fedora"

        echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
        echo "Press ENTER to continue."
        read cont

        ### Checking and applying updates 
        sudo dnf update && 

        ### Installing packages 
        sudo dnf install sway tmux swaybg kitty swayidle zsh swaylock pinentry-gtk pinentry \
        thunar polkit-gnome nnn neovim waybar alacritty mpv firefox zathura zathura-pdf-poppler evince git pulseaudio-utils pipewire-utils file-roller \
        NetworkManager-openconnect-gnome wofi brightnessctl gsettings-desktop-schemas wl-clipboard papirus-icon-theme NetworkManager-tui eom tlp \
        libnotify mako swaybg google-noto-color-emoji-fonts qalculate-gtk fzf 
        ;;
    *Arch* | *ARCH* | *arch*) echo -e "\033[0;32m Found Arch Linux.\033[0m"
        distro="Arch"

        echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
        echo "Press ENTER to continue."
        read cont

        ### Checking and applying updates 
	sudo pacman -Syu

        ### Installing packages 
        sudo pacman -S swaybg fzf tmux zsh nnn kitty networkmanager  nm-connection-editor neovim sway waybar wofi zathura-pdf-poppler zathura evince webkit2gtk-4.1 networkmanager-openconnect firefox lf tlp alacritty pulseaudio pulsemixer waybar mpv gsettings-desktop-schemas swayidle swaylock openconnect lxappearance wl-clipboard file-roller papirus-icon-theme gnome-themes-extra arc-gtk-theme ttf-jetbrains-mono ttf-jetbrains-mono-nerd gcr
        ;;
    *)
        echo -e "\033[0;32m You seem to be using a distro that is not covered by this script \033[0m "
        echo -e "\033[0;32m Cannot install packages \033[0m "
	echo -e "\033[0;32m Please install them manually (see this script for package names) \033[0m "
        echo "Press ENTER to continue."
        read cont
	;;
esac


## Make directory if .local/bin does not exist
ls $HOME/.local/bin || mkdir -p $HOME/.local/bin/

## create Pictures and screenshot dir if not existent
ls $HOME/Pictures/screenshots/ || mkdir -p $HOME/Pictures/screenshots

## If $HOME/.config does not exist make it
ls $HOME/.config/ || mkdir -p $HOME/.config/

## create .trash directory if it does not exist
mkdir $HOME/.trash/

## Ask user whether to copy or link configs and scripts 
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
	cp -r cfg_files/waybar $HOME/.config/
	cp -r cfg_files/wofi $HOME/.config/
	cp -r cfg_files/hypr $HOME/.config/
	cp -r cfg_files/zathura $HOME/.config/
	cp -r cfg_files/tmux $HOME/.config/
	echo "Press ENTER to continue."
	read cont
	echo -e "\033[0;32m copying scipts to '~/.local/bin/ \033[0m"

	echo "Press ENTER to continue."
	cp -r bin/* $HOME/.local/bin/
	read cont
	;;
    'l'|'L')
	### This folder will not exist initially
	mkdir -p $HOME/.config/nnn/
	echo -e "\033[0;32m creating sym-links...\033[0m "
	ln -s $HOME/glowing-enigma/cfg_files/alacritty $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/kitty $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/lf $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/mako $HOME/.config/
	ln -sf $HOME/glowing-enigma/cfg_files/nnn/plugins $HOME/.config/nnn/
	ln -s $HOME/glowing-enigma/cfg_files/nvim.back $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/sway $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/tmux $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/waybar $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/wofi $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/hypr $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/zathura $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/river $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/tmux $HOME/.config/
	echo "Press ENTER to continue."
	read cont

	echo -e "\033[0;32m linking scipts to '~/.local/bin/ \033[0m"
	ln -s $HOME/glowing-enigma/bin/* $HOME/.local/bin/

	echo "Press ENTER to continue."
	read cont
	;;
esac

## Enabling systemd services 
echo -e "\033[0;32m enabling systemd services \033[0m"
sudo systemctl enable tlp #### NOTE:: This is for Laptops. If you are on a Desktop, run `sudo systemctl disable tlp`
sudo systemctl set-default graphical.target




## Determining whether bash or zsh is running 

case "$SHELL" in
    *"bash"*)
	echo -e "\033[0;32m Found SHELL: bash \033[0m"
	cp cfg_files/shell/bash/bash_aliases $HOME/.bash_aliases
	cp cfg_files/shell/bash/bashrc  $HOME/.bashrc
	cp cfg_files/shell/bash/profile  $HOME/.bash_profile
	### If running Arch Linux, remove "source bashprofile" from bashrc 
	[ $distro = "Arch" ] && sed -i "s/source \/etc\/profile.d\/bash_completion.sh//" $HOME/.bashrc || echo "not Arch"
	echo "What do you  want to use"
	echo "[S]way"
	echo "[H]yprland"
	read choice
	case "$choice" in
	    "s" | "S"| "sway")
			### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
			[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || echo 'export WLR_RENDERER=vulkan
			export WLR_NO_HARDWARE_CURSORS=1
			export XWAYLAND_NO_GLAMOR=1
			[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu ' >> $HOME/.bash_profile && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway ' >> $HOME/.bash_profile
			;;
	    "h" | "H" | "hyprland")
			### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
			[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || echo 'export WLR_RENDERER=vulkan
			export WLR_NO_HARDWARE_CURSORS=1
			export XWAYLAND_NO_GLAMOR=1
			[ "$(tty)" = "/dev/tty1" ] && exec Hyprland'  >> $HOME/.bash_profile && '[ "$(tty)" = "/dev/tty1" ] && exec Hyprland' >> $HOME/.bash_profile
			;;
	    *)
			echo "Assuming you want to use sway."
			### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
			[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || echo 'export WLR_RENDERER=vulkan
			export WLR_NO_HARDWARE_CURSORS=1
			export XWAYLAND_NO_GLAMOR=1
			[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu ' >> $HOME/.bash_profile && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway ' >> $HOME/.bash_profile
			;;
	esac

	;;
    *"zsh"*)
	echo -e "\033[0;32m Found SHELL: zsh \033[0m"
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zshrc $HOME/.zshrc
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zshenv $HOME/.zshenv
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zprofile $HOME/.zprofile
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zcompdump $HOME/.zcompdump

	echo "What do you  want to use"
	echo "[S]way"
	echo "[H]yprland"
	read choice

	case "$choice" in
	    "s" | "S" | "sway")
		### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || (echo 'export WLR_RENDERER=vulkan
		export WLR_NO_HARDWARE_CURSORS=1
		export XWAYLAND_NO_GLAMOR=1' >> $HOME/.zshenv && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu' >> $HOME/.zprofile ) 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway' >> $HOME/.zprofile 
		;;
	    "h" | "H" | "hyprland")
		### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || (echo 'export WLR_RENDERER=vulkan
		export WLR_NO_HARDWARE_CURSORS=1
		export XWAYLAND_NO_GLAMOR=1' >> $HOME/.zshenv && echo '[ "$(tty)" = "/dev/tty1" ] && exec Hyprland' >> $HOME/.zprofile ) 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] && echo '[ "$(tty)" = "/dev/tty1" ] && exec Hyprland' >> $HOME/.zprofile 
		;;
	    *)
		echo "Assuming you want to use sway"
		### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || (echo 'export WLR_RENDERER=vulkan
		export WLR_NO_HARDWARE_CURSORS=1
		export XWAYLAND_NO_GLAMOR=1' >> $HOME/.zshenv && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu' >> $HOME/.zprofile ) 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway' >> $HOME/.zprofile 
		;;
	esac
esac

