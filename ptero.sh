#!/usr/bin/env bash

# Color codes
CYAN='\e[36m'
YELLOW='\e[33m'
RED='\e[31m'
GREEN='\e[32m'
ENDCOLOR='\e[0m'
BOLD='\e[1m'

# By Lifeboy banner (shown for 2 seconds)
echo -e "${YELLOW}${BOLD}"
echo "╔╗ ┬ ┬       ┬  ┬┌─┐┌─┐┌┐ ┌─┐┬ ┬"
echo "╠╩╗└┬┘  ───  │  │├┤ ├┤ ├┴┐│ │└┬┘"
echo "╚═╝ ┴        ┴─┘┴└  └─┘└─┘└─┘ ┴"
echo -e "${ENDCOLOR}"
sleep 2   # Wait for 2 seconds

clear      # Clear the terminal after displaying the Lifeboy banner

# MAIN MENU banner
echo -e "${CYAN}${BOLD}"
echo "███╗   ███╗ █████╗ ██╗███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗"
echo "████╗ ████║██╔══██╗██║████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║"
echo "██╔████╔██║███████║██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║"
echo "██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║"
echo "██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝"
echo "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝"
echo -e "${ENDCOLOR}"

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
