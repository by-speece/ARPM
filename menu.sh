#!/bin/bash

HEIGHT=15
WIDTH=60
CHOICE_HEIGHT=4
BACKTITLE=".settings Management"
TITLE="Arch Rice Package Management Menu"
MENU="What you want to do?"

OPTIONS=(1 "Install Configured Rice from official repo"
         2 "Install Configured Rice from community repo")


CHOICE=$(whiptail --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            sh ~/.tools/ARPM/official/menu.sh
            ;;
        2)
            sh ~/.tools/ARPM/community/menu.sh
            ;;
esac
sh tools
