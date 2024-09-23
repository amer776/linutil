#!/bin/sh -e

. ../../common-script.sh

installZoom() {
    if ! command_exists zoom; then
        printf "%b\n" "${YELLOW}Installing Zoom...${RC}"
        case "$PACKAGER" in
            pacman)
                "$AUR_HELPER" -S --needed --noconfirm zoom
                ;;
            *)
                . ./setup-flatpak.sh
                flatpak install -y flathub us.zoom.Zoom
                ;;
        esac
    else
        printf "%b\n" "${GREEN}Zoom is already installed.${RC}"
    fi
}

checkEnv
checkEscalationTool
checkAURHelper
installZoom