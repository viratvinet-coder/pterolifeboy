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
cat << "EOF"
╔╗ ┬ ┬       ┬  ┬┌─┐┌─┐┌┐ ┌─┐┬ ┬
╠╩╗└┬┘  ───  │  │├┤ ├┤ ├┴┐│ │└┬┘
╚═╝ ┴        ┴─┘┴└  └─┘└─┘└─┘ ┴
EOF
echo -e "${ENDCOLOR}"
sleep 2
clear

# MAIN MENU banner
echo -e "${CYAN}${BOLD}"
cat << "EOF"
███╗   ███╗ █████╗ ██╗███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
████╗ ████║██╔══██╗██║████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║
██╔████╔██║███████║██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
EOF
echo -e "${ENDCOLOR}"

while true; do
    echo -e "${GREEN}0) Install Pterodactyl Panel + Wings${ENDCOLOR}"
    echo -e "${YELLOW}1) Install Cloudflared${ENDCOLOR}"
    echo -e "${CYAN}2) Install Playit.gg${ENDCOLOR}"
    echo -e "${RED}3) Exit${ENDCOLOR}"
    echo -e "${CYAN}Select an option [0-3]:${ENDCOLOR}"
    read -r choice

    case "$choice" in
        0)
            echo -e "${GREEN}Running Pterodactyl installation...${ENDCOLOR}"
            bash <(curl -s https://pterodactyl-installer.se/)
            ;;

        1)
            echo -e "${YELLOW}${BOLD}Adding Cloudflare gpg key...${ENDCOLOR}"
            sudo mkdir -p --mode=0755 /usr/share/keyrings >/dev/null 2>&1
            curl -fsSL https://pkg.cloudflare.com/cloudflare-public-v2.gpg \
              | sudo tee /usr/share/keyrings/cloudflare-public-v2.gpg >/dev/null 2>&1

            echo -e "${YELLOW}Adding Cloudflared repo to your apt repositories...${ENDCOLOR}"
            echo "deb [signed-by=/usr/share/keyrings/cloudflare-public-v2.gpg] https://pkg.cloudflare.com/cloudflared any main" \
              | sudo tee /etc/apt/sources.list.d/cloudflared.list >/dev/null 2>&1

            echo -e "${YELLOW}Installing cloudflared...${ENDCOLOR}"
            sudo apt-get update >/dev/null 2>&1
            sudo apt-get install -y cloudflared >/dev/null 2>&1

            echo -e "${GREEN}${BOLD}Cloudflared installation completed!${ENDCOLOR}"
            sleep 2
            clear
            ;;

        2)
            echo -e "${YELLOW}Installing Playit.gg...${ENDCOLOR}"
            curl -SsL https://playit-cloud.github.io/ppa/key.gpg \
              | gpg --dearmor \
              | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
            echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" \
              | sudo tee /etc/apt/sources.list.d/playit-cloud.list >/dev/null

            sudo apt update >/dev/null 2>&1
            sudo apt install -y playit >/dev/null 2>&1

            echo -e "${GREEN}${BOLD}Playit.gg installation completed!${ENDCOLOR}"
            echo -e "${YELLOW}Starting Playit client...${ENDCOLOR}"
            playit
            echo -e "${GREEN}${BOLD}Playit session finished. Returning to menu...${ENDCOLOR}"
            read -rp "Press Enter to continue..."
            clear

            # Re-show MAIN MENU banner after Playit
            echo -e "${CYAN}${BOLD}"
            cat << "EOF"
███╗   ███╗ █████╗ ██╗███╗   ██╗    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
████╗ ████║██╔══██╗██║████╗  ██║    ████╗ ████║██╔════╝████╗  ██║██║   ██║
██╔████╔██║███████║██║██╔██╗ ██║    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝
EOF
            echo -e "${ENDCOLOR}"
            ;;

        3)
            echo -e "${RED}Exiting.${ENDCOLOR}"
            exit 0
            ;;

        *)
            echo -e "${RED}Invalid option. Please select 0, 1, 2, or 3.${ENDCOLOR}"
            ;;
    esac
done
