#!/bin/usr/sh

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
	cp -r cfg_files/river $HOME/.config/
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
	ln -s $HOME/glowing-enigma/cfg_files/tmux $HOME/.config/
	echo "Press ENTER to continue."
	read cont

	echo -e "\033[0;32m linking scipts to '~/.local/bin/ \033[0m"
	ln -s $HOME/glowing-enigma/bin/* $HOME/.local/bin/

	echo "Press ENTER to continue."
	read cont
	;;
esac



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
	echo "[R]iver"
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
	    "r" | "R" | "River")
			### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
			[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || echo 'export WLR_RENDERER=vulkan
			export WLR_NO_HARDWARE_CURSORS=1
			export XWAYLAND_NO_GLAMOR=1
			[ "$(tty)" = "/dev/tty1" ] && exec river'  >> $HOME/.bash_profile && '[ "$(tty)" = "/dev/tty1" ] && exec river' >> $HOME/.bash_profile
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
	echo "[R]iver"
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
	    "r" | "R" | "river")
		### If there are proprietary NVIDIA Drivers running write the following lines into .bash_profile 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] || (echo 'export WLR_RENDERER=vulkan
		export WLR_NO_HARDWARE_CURSORS=1
		export XWAYLAND_NO_GLAMOR=1' >> $HOME/.zshenv && echo '[ "$(tty)" = "/dev/tty1" ] && exec river' >> $HOME/.zprofile ) 
		[ -z "$(lspci -v | grep "driver in use *. nvidia")" ] && echo '[ "$(tty)" = "/dev/tty1" ] && exec river' >> $HOME/.zprofile 
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



