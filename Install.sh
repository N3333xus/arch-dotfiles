#!/bin/bash -S bash -e

#USERNAME=$(whoami)

clear

# DOTS
HYPRLAND_CONFIG_DIR="$HOME/.config/hypr"
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
WOFI_CONFIG_DIR="$HOME/.config/wofi"
KITTY_CONFIG_DIR="$HOME/.config/kitty"

# colours for text

BOLD='\e[1m'
BRED='\e[91m'
BBLUE='\e[34m'
BGREEN='\e[92m'
BYELLOW='\e[93m'
RESET='\e[0m'

REPO_DIR=$(dirname "$0")

# MY DOCUMENTS

WORKSPACEPACKAGES=(
	wlsunset 
	wireplumber 
	grim 
	slurp 
	wl-clipboard 
	hyprpaper 
	pavucontrol 
	pipewire 
	pipewire-pulse 
	brightnessctl
)
	
FONTPACKAGES=(
	ttf-jetbrains-mono-nerd 
	ttf-nerd-fonts-symbols 
	ttf-font-awesome 
	ttf-hack
)

USERPACKAGES=(
	bluez
	bluez-utils
	gvfs 
	thunar 
	thunar-volman 
	libreoffice 
	firefox 
	keepassxc
	btop 
	fastfetch 
	unzip 
	spotify-launcher
)

DEVPACKAGES=(
	git 
	dotnet-sdk-8.0 
	code
	gedit
)

NETWORKPACKAGES=(
	ufw
)

AURPACKAGES=(

	visual-studio-code-bin
	brave-bin
)


checkError(){ #FUNÇÃO QUE VERIFICA ERROS
	if [ $? -ne 0 ]; then
		echo "[ERRO], processo falhou: $1"
		exit 1
	fi

}

echo "=== Creating Workspace Directorys ===" #falta

mdkir Images
mkdir Documents
cd Documents
mkdir Projects Poison 
cd ..



echo "=== Updating the system  ==="
sudo pacman -Syu --noconfirm
checkError "!!! System Update Failed !!!"

echo "=== Pacman Packages Installation  ==="
sudo pacman -S --noconfirm \
	$WORKSPACEPACKAGES \
	$FONTPACKAGES \
	$USERPACKAGES \
	$DEVPACKAGES\
	$NETWORKPACKAGES
checkError "!!! Pacman Package installation failed !!!"


echo "=== Yay Setup ==="
git clone https://aur.archlinux.org/yay.git
cd yay 
makepkg -si
cd .. 
rm -r yay

echo "=== AUR Package Installation with yay ==="
checkError "!!! AUR Package Setup Failled !!!"
yay -S --noconfirm/
	$AURPACKAGES

checkError "=== yay package installation failed ==="


echo "=== Removing Useless Packages ===" #falta
	
sudo pacman -Rns dolphin


echo "=== Copiando/Atualizando dotfiles ==="

# Hyprland (hyprland.conf + hyprpaper.conf)
rsync -av "$REPO_DIR/hypr/" "$HYPRLAND_CONFIG_DIR/"
checkError "!!! Falha ao atualizar Hyprland !!!"

# Waybar (config + style.css)
rsync -av "$REPO_DIR/waybar/" "$WAYBAR_CONFIG_DIR/"
checkError "!!! Falha ao atualizar Waybar !!!"

# Wofi (config + style.css)
rsync -av "$REPO_DIR/wofi/" "$WOFI_CONFIG_DIR/"
checkError "!!! Falha ao atualizar Wofi !!!"

# Kitty (kitty.conf)
rsync -av "$REPO_DIR/kitty/" "$KITTY_CONFIG_DIR/"
checkError "!!! Falha ao atualizar Kitty !!!"

# Wallpapers (diretório separado)
rsync -av "$REPO_DIR/wallpapers/" "$HYPRLAND_CONFIG_DIR/wallpapers/"
checkError "!!! Falha ao copiar wallpapers !!!"















echo"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo"⠀⠀⠀⠀⠀⠀⠀⣠⡴⠞⠛⠉⠉⠉⠀⠈⠉⠉⠙⠛⠷⢦⣀⠀⠀⠀⠀⠀⠀⠀"
echo"⠀⠀⠀⠀⢀⣴⠟⢁⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣄⡉⠳⣄⠀⠀⠀⠀⠀"
echo"⠀⠀⠀⣠⠟⢁⣴⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣦⠈⢳⡄⠀⠀⠀"
echo"⠀⠀⣰⠏⢠⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣷⡀⢻⡄⠀⠀"
echo"⠀⢰⡟⠀⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣷⠈⣿⡀⠀"
echo"⠀⣾⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⠟⣀⣤⣄⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⡄⢸⡇⠀"
echo"⠀⣿⠀⠘⠛⠛⠛⠛⠛⠛⠛⠃⢸⣿⣿⣿⣷⠀⠛⠛⠛⠛⠛⠛⠛⠛⠃⢸⡇⠀"
echo"⠀⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡇⠀"
echo"⠀⠸⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣶⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠁⠀"
echo"⠀⠀⠹⣇⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⠀"
echo"⠀⠀⠀⠘⢧⡀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣠⡾⠁⠀⠀⠀"
echo"⠀⠀⠀⠀⠈⠻⢦⣀⠀⠸⢿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀"
echo"⠀⠀⠀⠀⠀⠀⠀⠉⠛⠶⣦⣤⣀⣉⣉⣉⣁⣠⣤⣴⠶⠛⠁⠀⠀⠀⠀⠀⠀⠀"
echo"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

echo "=== We are done punk... reboot this machine now!! ==="







