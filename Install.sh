#!/bin/bash

#USERNAME=$(whoami)

# DOTS
HYPRLAND_CONFIG_DIR="$HOME/.config/hypr"
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"
WOFI_CONFIG_DIR="$HOME/.config/wofi"
KITTY_CONFIG_DIR="$HOME/.config/kitty"

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
	gvfs 
	thunar 
	thunar-volman 
	libreoffice 
	firefox 
	keepassxc 
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


checkError(){ #FUNÇÃO QUE VERIFICA ERROS
	if [ $? -ne 0 ]; then
		echo "[ERRO], processo falhou: $1"
		exit 1
	fi

}

echo "=== Creating Workspace Directorys ===" #falta



echo "=== Updating the system  ==="
sudo pacman -Syu --noconfirm
checkError "!!! System Update Failed !!!"

echo "=== Packages Installation  ==="
sudo pacman -S --noconfirm \
	$WORKSPACEPACKAGES \
	$FONTPACKAGES \
	$USERPACKAGES \
	$DEVPACKAGES\
	$NETWORKPACKAGES
checkError "!!! Package installation failed !!!"
	

echo "=== Removing Useless Packages ===" #falta
	
sudo pacman -Rns dolphin

echo "=== Hyprland Setup ===" #falta

echo "=== Hyprpaper Setup ===" #falta
cat > $HYPRLAND_CONFIG_DIR/hyprpaper.conf << EOF

EOF
checkError "!!! Hyprpaper Setup Failed !!!"


echo "=== Wofi Setup ===" #falta
mkdir -p $WOFI_CONFIG_DIR 
cat > $WOFI_CONFIG_DIR/config << EOF
# CONFIG do wofi aqui
EOF
cat > $WOFI_CONFIG_DIR/style.css << EOF
# ESTILO DO WOFI AQUI
EOF
checkError "!!! Wofi Setup Failed !!!"

echo "=== Waybar Setup ===" #falta
mkdir -p $WAYBAR_CONFIG_DIR
cat > $WAYBAR_CONFIG_DIR/config << EOF
#CONFIG DO WAYBAR AQUI
EOF
cat > $WAYBAR_CONFIG_DIR/style.css << EOF
# ESTILO DA WAYBAR AQUI
EOF
checkError "!!! Waybar Setup Failed !!!"

echo "=== Kitty Setup ===" # FEITO
mkdir -p $KITTY_CONFIG_DIR
cat > $KITTY_CONFIG_DIR/kitty.conf << EOF
background #0a0a0a
foreground #ffeedd
selection_background #333333
selection_foreground #ebdbb2

color0 #1a1a1a
color8 #333333
color1 #689d6a
color9 #8ec07c
color2 #98971a
color10 #b8bb26
color3 #d79921
color11 #fabd2f
color4 #458588
color12 #83a598
color5 #b16286
color13 #d3869b
color6 #1793D1
color14 #5fd1fa
color7 #ebdbb2
color15 #ffeedd

cursor #fba02f
cursor_text_color #ffffff
url_color #458588

window_padding_width 8
active_border_color #cc241d
inactive_border_color #333333
bell_border_color #cc241d

background_opacity 0.85
dynamic_background_opacity yes
hide_window_decorations titlebar-only

font_family Hack
bold_font Hack Bold
italic_font Hack Italic
bold_italic_font Hack Bold Italic

font_size 9
EOF
checkError "!!! Kitty setup failed !!!"

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







