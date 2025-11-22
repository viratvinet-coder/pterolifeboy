#!/usr/bin/env bash

while true; do
    echo "===== MAIN MENU ====="
    echo "0) Install Pterodactyl Panel + Wings"
    echo "1) Exit"
    echo "Select an option [0-1]:"
    read choice

    case "$choice" in
        0)
            echo "Running Pterodactyl installation..."
            bash <(curl -s https://pterodactyl-installer.se/)
            ;;
        1)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 0 or 1."
            ;;
    esac
done
