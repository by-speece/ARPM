#!/bin/bash
cmd=(whiptail --separate-output --checklist "Select modules:" 20 50 10)
options=(1 "Install .settings rice" on    # any option can be set to default to "on"
         2 "Install dependencies form Repo" on
         3 "Install dependencies from AUR" on
         4 "Install Extra Apps from Repo" off
         5 "Install Extra Apps from AUR" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            rm ~/.settings
            mkdir ~/.settings
            cp -rfa ~/.tools/ARPM/official/Speece_DE/.  ~/.settings
            rm -rf ~/.config/gtk-3.0
            ln -s ~/.settings/config/gtk-3.0	~/.config/
            rm -rf ~/.config/dunst
            ln -s ~/.settings/config/dunst		~/.config/
            rm -rf ~/.config/i3
            ln -s ~/.settings/config/i3		~/.config/
            rm -rf ~/.config/Typora
            ln -s ~/.settings/config/Typora	~/.config/
            rm -rf ~/.config/mpv
            ln -s ~/.settings/config/mpv		~/.config/
            rm -rf ~/.config/nautilus
            ln -s ~/.settings/config/nautilus	~/.config/
            rm -rf ~/.config/polybar
            ln -s ~/.settings/config/polybar	~/.config/
            rm -rf ~/.config/ranger
            ln -s ~/.settings/config/ranger	~/.config/
            rm -rf ~/.config/rofi
            ln -s ~/.settings/config/rofi		~/.config/
            rm -rf ~/.config/libinput-gestures.conf
            ln -s ~/.settings/config/libinput-gestures.conf	~/.config/libinput-gestures.conf
            rm -rf ~/.config/picom.conf
            ln -s ~/.settings/config/picom.conf	~/.config/picom.conf
            rm -rf ~/.bashrc
            ln -s ~/.settings/.bashrc		~/
            rm -rf ~/.nanorc
            ln -s ~/.settings/.nanorc		~/
            rm -rf ~/.p10k.zsh
            ln -s ~/.settings/.p10k.zsh		~/
            rm -rf ~/.zshrc
            ln -s ~/.settings/.zshrc		~/
            rm -rf ~/.zshrc.zni
            ln -s ~/.settings/.zshrc.zni		~/
            rm -rf ~/.config/alacritty
            ln -s ~/.settings/config/alacritty	~/.config/
            ;;
        2)
            sudo pacman -Syu --needed --noconfirm -<~/.tools/ARPM/official/Speece_DE/dependencies/base-repo.txt
            sudo chmod +s /usr/bin/light
            ;;
        3)
            yay -Syu --noconfirm --needed -<~/.tools/ARPM/official/Speece_DE/dependencies/base-aur.txt
            sudo rm -rf /etc/systemd/system/display-manager.service
            sudo systemctl enable ly.service
            ;;
        4)
            sudo pacman -Syu --needed --noconfirm -<~/.tools/ARPM/official/Speece_DE/dependencies/extra-repo.txt
            ;;
        5)
            yay -Syu --noconfirm --needed -<~/.tools/ARPM/official/Speece_DE/dependencies/extra-aur.txt
            ;;
    esac
done
sh tools
