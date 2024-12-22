#pa
#     noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-jetbrains-mono ttf-joypixels ttf-font-awesome \
#     sxiv mpv zathura zathura-pdf-mupdf ffmpeg imagemagick  \
#     fzf man-db xwallpaper python-pywal unclutter xclip maim \
#     zip unzip unrar p7zip xdotool papirus-icon-theme brightnessctl  \
#     dosfstools ntfs-3g git sxhkd zsh pipewire pipewire-pulse \
#     emacs-nox arc-gtk-theme rsync qutebrowser dash \
#     xcompmgr libnotify dunst slock jq aria2 cowsay \
#     dhcpcd connman wpa_supplicant rsync pamixer mpd ncmpcpp \
#     zsh-syntax-highlighting xdg-user-dirs libconfig \
#     bluez bluez-utils libxft libxinerama openssh
#

## Install fonts
#sudo pacman -S ttf-jetbrains-mono ttf-font-awesome ttf-joypixels noto-fonts noto-fonts-emoji noto-fonts-cjk
#
## Install general utility programs
#sudo pacman -S \
#	less \
#	htop \
#	neofetch `#Pretty print system info` \
#	openssh \
#	man-db `#Man pages` \
#	zip \
#	unzip \
#	unrar \
#	fzf \
#	tmux \
#	npm \
#	maim `#Screenshots` \
#	qutebrowser `#Vim-like browser`
#
#echo "Replacing sh with dash..."
#sudo pacman -S dash
#sudo rm /bin/sh
#sudo ln -s dash /bin/sh

## paru: AUR helper
#git clone https://aur.archlinux.org/paru.git ~/.paru
#cd ~/.paru
#makepkg -si

## Nerd fonts tool
#paru -S getnf
#getnf -i JetBrainsMono

#
## dwm: Window Manager
#echo "Installing dwm X-server and dependencies..."
#sudo pacman -S xorg-server xorg-xinit xorg-xkill xorg-xsetroot xorg-xbacklight xorg-xprop xdg-user-dirs xdotool
#sudo pacman -S libxft libxinerama
#mkdir ~/.local/src
#git clone --depth=1 git@github.com:philjun/dwm.git ~/.local/src/dwm
#sudo make -C ~/.local/src/dwm install
#
## st: Terminal
#echo "Installing st and dependencies..."
#git clone --depth=1 git@github.com:philjun/st.git ~/.local/src/st
#sudo make -C ~/.local/src/st install
##
## dmenu: Program Menu
#echo "Installing dmenu and dependencies..."
#git clone --depth=1 git@github.com:philjun/dmenu.git ~/.local/src/dmenu
#sudo make -C ~/.local/src/dmenu install
#
## dwmblocks: Status bar for dwm
#echo "Installing dwmblocks and dependencies..."
#git clone --depth=1 git@github.com:philjun/dwmblocks.git ~/.local/src/dwmblocks
#sudo make -C ~/.local/src/dwmblocks install
#
## sent: Simple plaintext presentation tool
#echo "Installing sent and dependencies..."
# paru -S farbfeld-git
# git clone --depth=1 git@github.com:philjun/sent.git ~/.local/src/sent
# sudo make -C ~/.local/src/sent install

## Wallpaper and shell ricing
#paru -S python-pywal16
#sudo pacman -S xwallpaper xcompmgr
#sudo pacman -S zsh zsh-syntax-highlighting
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#mv ~/.oh-my-zsh ~/.config/zsh/oh-my-zsh
#
## Create directories
#mkdir ~/dl ~/dox ~/music ~/code
#mkdir -p ~/pix/wall
#
## Clone into progcomp code
#git clone git@github.com:philjun/progcomp.git ~/code/progcomp
#
## Fix dotfiles
#git clone git@github.com:philjun/.dotfiles.git ~/.dotfiles
#rm ~/.xinitrc
#ln -s ~/.dotfiles/.xinitrc ~/.xinitrc
#rm ~/.zshrc
#ln -s ~/.dotfiles/.zshrc ~/.zshrc
#rm ~/.oh-my-zsh/themes/alanpeabody.zsh-theme
#ln -s ~/.dotfiles/.oh-my-zsh/themes/alanpeabody.zsh-theme ~/.oh-my-zsh/themes/alanpeabody.zsh-theme
#mkdir ~/.config/tmux
#ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf
#
## get wallpapers
#git clone git@github.com:philjun/wallpapers.git ~/pix/wall
#
## Get local bin
#git clone git@github.com:philjun/local-bin.git ~/.local/bin

#### Lazyvim ####
# Dependencies
#sudo pacman -S neovim lazygit gcc ripgrep fd
#paru -S libstdc++5
#
# Backing up existing configuration
# required
#mv ~/.config/nvim{,.bak}
#
## optional but recommended
#mv ~/.local/share/nvim{,.bak}
#mv ~/.local/state/nvim{,.bak}
#mv ~/.cache/nvim{,.bak}
#
## Clone starter repo
#git clone git@github.com:philjun/lazyvim.git ~/.config/nvim

# Use personalized pywal16 colors in lazyvim
#git clone git@github.com:philjun/pywal16.nvim.git ~/.local/share/nvim/lazy/pywal16.nvim

#### Lazyvim done #####

###### Laptop specific #####
## Battery management
#sudo pacman -S tlp
#sudo systemctl enable tlp.service
#sudo systemctl start tlp.service
#sudo systemctl mask systemd-rfkill.socket
#sudo systemctl mask systemd-rfkill.service
#
## CPU power management
#sudo pacman -S cpupower
#echo 'GOVERNOR="schedutil"' | sudo tee -a /etc/default/cpupower
#sudo systemctl enable cpupower --now

# Swap management
#echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf
#sudo sysctl -p

# Power consumption monitor
#sudo pacman -S powertop
#sudo powertop --auto-tune

# Fix resolution on dock
#sudo tee /etc/X11/xorg.conf.d/10-monitor.conf <<EOF
#Section "Monitor"
#        Identifier "HDMI-1"
#        Modeline "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
#        Option "PreferredMode" "2560x1440_60.00"
#EndSection
#
#Section "Screen"
#        Identifier "Screen0"
#        Monitor "HDMI-1"
#        DefaultDepth 24
#        SubSection "Display"
#                Modes "2560x1440_60.00"
#        EndSubSection
#EndSection
#
#Section "Device"
#        Identifier "Device0"
#        Driver "modesetting"
#EndSection
#EOF

# TODO! Should I use this:
## dmenu: Dmenu based Password Prompt
#git clone --depth=1 https://github.com/ritze/pinentry-dmenu.git ~/.local/src/pinentry-dmenu
#sudo make -C ~/.local/src/pinentry-dmenu clean install

exit
