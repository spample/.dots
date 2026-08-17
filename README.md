#   This are the steps!!

### Update packages
```bash
sudo pacman -Syu
```
### Install base-devel & git
```bash
sudo pacman -S --needed base-devel git
```
### Installing yay
```bash
mkdir -p $HOME/Documents/github
cd $HOME/Documents/github
git clone https://aur.archlinux.org/yay.git
```bash
cd yay
makepkg -si 
```
---
### apps I use
```bash
sudo pacman -S --needed hyprpaper waybar hyprlock hypridle keyd mpd rmpc neovim rofi swaync qt6ct tmux wev kvantum networkmanager network-manager-applet nemo brightnessctl hyprpicker gimp gmic gimp-plugin-gmic ghostscript gsfonts mypaint-brushes imagemagick nodejs npm clang docker xorg-xhost ufw openssh unzip git base-devel fastfetch stow noto-fonts-emoji usbutils libreoffice-fresh zip kicad kicad-library kicad-library-3d sl firefox kitty cmake flameshot vlc vlc-plugin-ffmpeg rofi-emoji wpaperd bat p7zip unrar bluetui obsidian btop filezilla nvm pavucontrol evtest discord ruby tree alsa-utils nwg-look gnome-themes-extra nextcloud-client gpu-screen-recorder gpu-screen-recorder-ui gpu-screen-recorder-notification superfile tree-sitter-cli
```
```bash
yay -S --needed wlogout hyprshot gimp-plugin-resynthesizer docker-buildx webapp-manager zen-browser-bin clipse lazydocker ventoy-bin ventoy-bin ttf-vista-fonts
```
### Other apps
```bash
sudo pacman -S intel-media-driver vulkan-intel mesa qt6-wayland
```


---
### OpenSSH
####  Start SSH daemon
```bash
sudo systemctl start sshd
sudo systemctl enable sshd
```
####  allow port
```bash
sudo ufw allow 22/tcp
```
---
### Github setup
```bash
git config --global user.name spample
```
```bash
git config --global user.email luis.antonio.gonzalez501@gmail.com
```
```bash
git config --global init.defaultBranch main
```
### Github ssh setup
```bash
eval "$(ssh-agent -s)"
```
```bash
ssh-keygen -t ed25519 -C luis.antonio.gonzalez501@gmail.com
```
#### copy key in Linux(X11)
```bash
xclip -selection clipboard $HOME/.ssh/id_ed25519.pub 
```
#### copy key in Linux(Wayland)
```bash
cat $HOME/.ssh/id_ed25519.pub | wl-copy
```
```bash
ssh -T git@github.com
```
---
### Create your fonts directory
```bash
mkdir -p $HOME/.local/share/fonts
```
### Download the font directly from the Nerd Fonts project
```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O /tmp/FiraCode.zip
```
### Unzip
```bash
unzip /tmp/FiraCode.zip -d $HOME/.local/share/fonts/FiraCode
```
### Refresh the font cache
```bash
fc-cache -fv
```
### Verify the font is installed
```bash
fc-list | grep "FiraCode Nerd Font Mono"
```
### if you want more fonts, run this
### makes github directory
```bash
mkdir -p $HOME/Documents/github
cd $HOME/Documents/github
```
### Installs font bulk download & downloads it ~2-3 GB!
```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git

cd nerd-fonts

./install.sh
```
### Refresh the font cache
```bash
fc-cache -fv
```
---
### Installing Zsh, ohmyzsh, ohmyposh, zinit
#### Zsh
```bash
sudo pacman -S --needed zsh
```
```bash
chsh -s /bin/zsh
```
#### ohmyzsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
#### ohmyposh
```bash
yay -S oh-my-posh
```
#### zinit
```bash
sudo pacman -S zoxide
```
```bash
git clone https://github.com/zdharma-continuum/zinit.git $HOME/.local/share/zinit/zinit.git
```
```bash
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
```
```bash
source $HOME/.zshrc
```
### Removing files to make links later
```bash
rm $HOME/.bashrc
rm $HOME/.bash_history
rm $HOME/.bash_logout
rm $HOME/.bash_profile
rm $HOME/.config/starship.toml
rm $HOME/.wezterm.lua
rm $HOME/.zshrc

rm  -rf $HOME/.config/kitty
rm  -rf $HOME/.config/nvim
rm  -rf $HOME/.config/hypr
rm  -rf $HOME/.config/keyd
rm  -rf $HOME/.config/mpd
rm  -rf $HOME/.config/rmpc
rm  -rf $HOME/.config/rofi
rm  -rf $HOME/.config/swaync
rm  -rf $HOME/.config/waybar
rm  -rf $HOME/.config/wlogout
sudo rm /etc/systemd/logind.conf
```
# Stow:
run `stow .` from the dots directory
or for force link run `stow . --adopt --override --restow`

make sure to have the dots on the home directory


##  keyd installation
```bash
cd ~/Documents/github
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
```
### symlink into system shortcuts
```bash
sudo ln -s ~/.dots/.config/keyd/default.conf /etc/keyd/
```
---
## GTK Theme
```bash
mkdir -p ~/.themes
cd ~/.themes
git clone https://github.com/EliverLara/Nordic.git
```
```bash
sudo mv Nordic /usr/share/themes/
```
---
### docker
```bash
sudo systemctl enable docker.service
sudo systemctl enable docker.socket
```
```bash
sudo systemctl start docker.socket
sudo systemctl start docker.service
```
```bash
sudo usermod -aG docker $USER
```
---
### Set NodeJS to the correct version for my neovim markdown preview plugin
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

```
```bash
nvm install 20
nvm use 20
nvm alias default 20
```
#### live server plugin
```bash
npm install -g live-server
```
---
### systems stuff
```bash
sudo systemctl enable --now NetworkManager
nm-applet --indicator &
```
---
##  PlatformIO
```bash
curl -fsSL -o get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py
python3 get-platformio.py
```
---
##  Kvantum stuff
- Create a Kvantum symlink
```bash
ln -s /home/spample/.dots/misc/Kvanthum/ /home/spample/Documents/
```
- Go to Kvantum Manager application and install the Nordic Darker Theme inside the Kvantum folder
- Apply the theme in Kvantum manager
- go into the qt6ct app and also select dark Kvantum
---
### sddm
```bash
https://github.com/uiriansan/SilentSDDM
```

```bash
yay -S sddm-silent-theme
```

```bash
sudo pacman -S --needed sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
```

```bash
sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
```

```bash
sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
```

####  If you dont have a sddm.conf in /etc/

```bash
sudo sddm --example-config | sudo tee /etc/sddm.conf > /dev/null
sudo mkdir -p /etc/sddm.conf.d
```
```bash
[Theme]
Current=sddm-astronaut-theme``
```

```bash
sudo -e /etc/sddm.conf.d/virtualkbd.conf
```
```bash
echo "[General]                         
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf
```
edit the 'ConfigFile=' section to change theme
```bash
sudo -e /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
```
metadata.desktop
```bash
[SddmGreeterTheme]
Name=sddm-astronaut-theme
Description=sddm-astronaut-theme
Author=keyitdev
Website=https://github.com/Keyitdev/sddm-astronaut-theme
License=GPL-3.0-or-later
Type=sddm-theme
Version=1.3
ConfigFile=Themes/man-with-jelly.conf
Screenshot=Previews/astronaut.png
MainScript=Main.qml
TranslationsDirectory=translations
Theme-Id=sddm-astronaut-theme
Theme-API=2.0
QtVersion=6
```

copy the mp4 file to the background folder

```bash
sudo cp ~/.dots/misc/man-with-jellyfish-in-space.mp4 /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
```
copy the conf file into the themes
```bash
sudo cp ~/.dots/misc/man-with-jelly.conf /usr/share/sddm/themes/sddm-astronaut-theme/Themes/
```
to Test theme use 
```bash
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/sddm-astronaut-theme/
```
---
### System.conf (path: /etc/systemd/system/system.conf)
```bash
sudo rm -rf /etc/systemd/system/system.conf
cp ~/.dots/misc/system/system.conf /etc/systemd/system/system.conf 
```
---
### Music
```bash
sudo pacman -S timidity++
sudo mkdir -p /etc/timidity
sudo cp /usr/share/timidity/timidity.cfg /etc/timidity/
```
---
### Sub-modules
how to get sub-modules
```bash
git submodule update --init --recursive
```
update modules
```bash
git submodule update --remote --merge
```
---
## Misc
ROS 2
```ros2
yay -S ros2-humble 
```
obs-virt-cam
```
sudo pacman -S obs-studio v4l2loopback-dkms linux-headers
```
Load the module to create a virtual device:
```
sudo modprobe v4l2loopback exclusive_caps=1 card_label="OBS Virtual Camera"
```
## Load your graphics driver during the initramfs stage 
```bash
sudo nvim /etc/mkinitcpio.conf
```
#### NVIDIA:
```Bash
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```
#### AMD:
```bash
MODULES=(amdgpu)
```
#### Intel:
```bash
MODULES=(i915)
```

### Rebuild initramfs image
```bash
sudo mkinitcpio -P
```


# ToDo
- [ ] Re-organize README
- [ ] Add README summery/Description
- [ ] Redo SDDM-greeter
- [ ] Get rid of old apps I dont use
- [ ] get rid of old system stuff I dont use
- [ ] Get a Keyring manager so Nextcloud stops bugging me on login
