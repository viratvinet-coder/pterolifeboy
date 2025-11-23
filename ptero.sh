#!/usr/bin/env bash

# Color codes
CYAN='\e[36m'
YELLOW='\e[33m'
GREEN='\e[32m'
RED='\e[31m'
ENDCOLOR='\e[0m'
BOLD='\e[1m'

# MAIN MENU banner
echo -e "${CYAN}${BOLD}"
echo "  _                                  "
echo "  /\\/\\   __ _(_)_ __     /\\/\\   ___ _ __  _   _ "
echo " /    \\ / _\` | | '_ \\   /    \\ / _ \\ '_ \\| | | |"
echo "/ /\\/\\ \\ (_| | | | | | / /\\/\\ \\  __/ | | | |_| |"
echo "\\/    \\/\\__,_|_|_| |_| \\/    \\/\\___|_| |_|\\__,_|"
echo -e "${ENDCOLOR}"

# Creator name
echo -e "${YELLOW}${BOLD}Made BY LIFEBOYGAMING${ENDCOLOR}"

while true; do
    echo -e "${GREEN}0) Install Pterodactyl Panel + Wings${ENDCOLOR}"
    echo -e "${RED}1) Exit${ENDCOLOR}"
    echo -e "${CYAN}Select an option [0-1]:${ENDCOLOR}"
    read choice

    case "$choice" in
        0)
            echo -e "${GREEN}Running Pterodactyl installation...${ENDCOLOR}"
            bash <(curl -s https://pterodactyl-installer.se/)
            ;;
        1)
            echo -e "${RED}Exiting.${ENDCOLOR}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please select 0 or 1.${ENDCOLOR}"
            ;;
    esac
done
