#!/bin/sh

# Hello there fellow traveler. (just kidding) This script is propetually work-in-progress. So if for some reason you decide to 
# Run or inspect this script and have suggestions to improve this script. Feel free to let me know.


## Determine what distro is running ##

release="$(cat /etc/*-release)"

echo -e "\033[0;32m Determining Distro ... \033[0m "


case $release in
    *Debian* | *debian* | *DEBIAN*) echo -e "\033[0;32m Found Debian.\033[0m "
        distro="Debian"

        echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
        echo "Press ENTER to continue."
        read cont

        ### Checking and applying updates ###
        sudo apt update && sudo apt upgrade -y

        ### Installing packages ###
        sudo apt install swaylock zsh file-roller evince flatpak cbatticon network-manager network-manager-gnome network-manager-openconnect-gnome eom network-manager-openconnect lxappearance git lf neovim fonts-jetbrains-mono firefox-esr tlp alacritty kitty brightnessctl pulsemixer sway wofi waybar fonts-material-design-icons-iconfont fonts-font-awesome xwayland libglib2.0-bin fonts-noto-color-emoji wlr-randr nala wl-clipboard mpv swayidle papirus-icon-theme gnome-themes-extra pulseaudio arc-theme libnotify-bin mako-notifier acpi-support acpid acpi linux-cpupower cpufrequtils openssh-server nnn fzf
        ;;
    *Fedora* | *FEDORA* | *fedora*) echo -e "\033[0;32m Found Fedora.\033[0m"
        distro="Fedora"

        echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
        echo "Press ENTER to continue."
        read cont

        ### Checking and applying updates ###
        sudo dnf update && 

        ### Installing packages ###
        sudo dnf install sway swaybg kitty swayidle zsh swaylock pinentry-gtk pinentry \
        thunar polkit-gnome nnn neovim waybar alacritty mpv firefox zathura zathura-pdf-poppler evince git pulseaudio-utils pipewire-utils file-roller \
        NetworkManager-openconnect-gnome wofi brightnessctl gsettings-desktop-schemas wl-clipboard papirus-icon-theme NetworkManager-tui eom tlp \
        libnotify mako swaybg google-noto-color-emoji-fonts qalculate-gtk fzf 
        ;;
    *Arch* | *ARCH* | *arch*) echo -e "\033[0;32m Found Arch Linux.\033[0m"
        distro="Arch Linux"

        echo -e "\033[0;32m Going to update and install predefined packages(see this script) \033[0m "
        echo "Press ENTER to continue."
        read cont

        ### Checking and applying updates ###
	sudo pacman -Syu

        ### Installing packages ###
        sudo pacman -S fzf zsh nnn kitty networkmanager  nm-connection-editor neovim sway waybar wofi zathura-pdf-poppler zathura evince webkit2gtk-4.1 networkmanager-openconnect firefox lf tlp alacritty pulseaudio pulsemixer waybar mpv gsettings-desktop-schemas nerd-fonts swayidle swaylock openconnect lxappearance wl-clipboard file-roller papirus-icon-theme gnome-themes-extra arc-gtk-theme
        ;;
    *)
esac


## Make directory if .local/bin does not exist ##
ls $HOME/.local/bin || mkdir -p $HOME/.local/bin/ 

## create Pictures and screenshot dir if not existent ##
ls $HOME/Pictures/screenshots/ || mkdir -p $HOME/Pictures/screenshots
mkdir $HOME/.trash/

## Ask user whether to copy or link configs and scripts ##
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
	ln -s $HOME/glowing-enigma/cfg_files/alacritty $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/kitty $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/lf $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/mako $HOME/.config/
	ln -sf $HOME/glowing-enigma/cfg_files/nnn/plugins $HOME/.config/nnn/
	ln -s $HOME/glowing-enigma/cfg_files/nvim.back $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/sway $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/tmux $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/vifm $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/waybar $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/wofi $HOME/.config/
	ln -s $HOME/glowing-enigma/cfg_files/zathura $HOME/.config/
	echo "Press ENTER to continue."
	read cont

	echo -e "\033[0;32m linking scipts to '~/.local/bin/ \033[0m"
	ln -s $HOME/glowing-enigma/bin/* $HOME/.local/bin/

	echo "Press ENTER to continue."
	read cont
	;;
esac

## Enabling systemd services ##
echo -e "\033[0;32m enabling systemd services \033[0m"
sudo systemctl enable tlp #### NOTE: this is for Laptops, If you are on a Desktop, run `sudo systemctl disable tlp`
sudo systemctl set-default graphical.target




## Determining whether bash or zsh is running ##

case "$SHELL" in
    *"bash"*)
	echo -e "\033[0;32m Found SHELL: bash \033[0m"
	cp cfg_files/shell/bash/bash_aliases $HOME/.bash_aliases
	cp cfg_files/shell/bash/bashrc  $HOME/.bashrc
	cp cfg_files/shell/bash/profile  $HOME/.bash_profile
	### If running Arch Linux, remove "source bashprofile" from bashrc ###
	[ $distro = "Arch Linux" ] && sed -i ""$(awk '/source/ {print FNR}' $HOME/.bashrc)" d" $HOME/.bashrc
	### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile ###
	[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || echo 'export WLR_RENDERER=vulkan
	export WLR_NO_HARDWARE_CURSORS=1
	export XWAYLAND_NO_GLAMOR=1
	[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu ' >> $HOME/.bash_profile && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway ' >> $HOME/.bash_profile
	;;
    *"zsh"*)
	echo -e "\033[0;32m Found SHELL: zsh \033[0m"
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zshrc $HOME/.zshrc
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zshenv $HOME/.zshenv
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zprofile $HOME/.zprofile
	cp $HOME/glowing-enigma/cfg_files/shell/zsh/zcompdump $HOME/.zcompdump
	### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile ###
	[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || (echo 'export WLR_RENDERER=vulkan
	export WLR_NO_HARDWARE_CURSORS=1
	export XWAYLAND_NO_GLAMOR=1' >> $HOME/.zshenv && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway --unsupported-gpu' >> $HOME/.zprofile ) 
	[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] && echo '[ "$(tty)" = "/dev/tty1" ] && exec sway' >> $HOME/.zprofile 
	;;
esac

