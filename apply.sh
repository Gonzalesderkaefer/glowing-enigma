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
