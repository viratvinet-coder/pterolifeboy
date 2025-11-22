#!/usr/bin/env bash

# Color codes
RED='\e[31m'
GREEN='\e[32m'
CYAN='\e[36m'
YELLOW='\e[33m'
ENDCOLOR='\e[0m'
BOLD='\e[1m'

# ASCII banner
echo -e "${CYAN}${BOLD}"
echo "██████╗ ████████╗██████╗ ███████╗██╗   ██╗"
echo "██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██║   ██║"
echo "██████╔╝   ██║   ██║  ██║█████╗  ██║   ██║"
echo "██╔══██╗   ██║   ██║  ██║██╔══╝  ██║   ██║"
echo "██║  ██║   ██║   ██████╔╝███████╗╚██████╔╝"
echo "╚═╝  ╚═╝   ╚═╝   ╚═════╝ ╚══════╝ ╚═════╝ "
echo -e "${ENDCOLOR}"

while true; do
    echo -e "${YELLOW}===== ${BOLD}MAIN MENU${ENDCOLOR}${YELLOW} =====${ENDCOLOR}"
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
