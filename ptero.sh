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
sleep 2
clear

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
    echo -e "${YELLOW}1) Install Cloudflared${ENDCOLOR}"
    echo -e "${RED}2) Exit${ENDCOLOR}"
    echo -e "${CYAN}Select an option [0-2]:${ENDCOLOR}"
    read choice

    case "$choice" in
        0)
            echo -e "${GREEN}Running Pterodactyl installation...${ENDCOLOR}"
            bash <(curl -s https://pterodactyl-installer.se/)
            ;;
        1)
            echo -e "${YELLOW}${BOLD}Adding Cloudflare gpg key...${ENDCOLOR}"
            sudo mkdir -p --mode=0755 /usr/share/keyrings >/dev/null 2>&1
            curl -fsSL https://pkg.cloudflare.com/cloudflare-public-v2.gpg | sudo tee /usr/share/keyrings/cloudflare-public-v2.gpg >/dev/null 2>&1
            echo -e "${YELLOW}Adding Cloudflared repo to your apt repositories...${ENDCOLOR}"
            echo 'deb [signed-by=/usr/share/keyrings/cloudflare-public-v2.gpg] https://pkg.cloudflare.com/cloudflared any main' | sudo tee /etc/apt/sources.list.d/cloudflared.list >/dev/null 2>&1
            echo -e "${YELLOW}Installing cloudflared...${ENDCOLOR}"
            sudo apt-get update >/dev/null 2>&1
            sudo apt-get install -y cloudflared >/dev/null 2>&1
            echo -e "${GREEN}${BOLD}Installation is completed!${ENDCOLOR}"
            sleep 2
            clear
            # Show menu again
            echo -e "${CYAN}${BOLD}"
            echo "███╗   ███╗ █████╗ ██╗███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗"
            echo "████╗ ████║██╔══██╗██║████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║"
            echo "██╔████╔██║███████║██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║"
            echo "██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║"
            echo "██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝"
            echo "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝"
            echo -e "${ENDCOLOR}"
            ;;
        2)
            echo -e "${RED}Exiting.${ENDCOLOR}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please select 0, 1, or 2.${ENDCOLOR}"
            ;;
    esac
done
