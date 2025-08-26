#   Instructions

### Update packages
```
sudo pacman -Syu
```

### Create your fonts directory

```
mkdir -p $HOME/.local/share/fonts
```

### Download the font directly from the Nerd Fonts project
```
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O /tmp/FiraCode.zip
```

### Unzip
```
sudo pacman -S unzip
```
```
unzip /tmp/FiraCode.zip -d $HOME/.local/share/fonts/FiraCode
```

### Refresh the font cache
```
fc-cache -fv
```

### Verify the font is installed
```
fc-list | grep "FiraCode Nerd Font Mono"
```

### if you want more fonts, run this
### makes github directory
```
mkdir -p $HOME/Documents/github
cd $HOME/Documents/github
```

### Installs font bulk download & downloads it ~2-3 GB!
```
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git

cd nerd-fonts

./install.sh
```

### Refresh the font cache
```
fc-cache -fv
```

### installing FastFetch
```
sudo pacman -S fastfetch
```

### Installing yay

```
sudo pacman -Syu
```
```
sudo pacman -S --needed git base-devel
```
```
cd $HOME/Documents/github
git clone https://aur.archlinux.org/yay.git
```
```
cd yay
makepkg -si 
```

### Installing Zsh, ohmyzsh, ohmyposh, zinit

#### Zsh
```
sudo pacman -S zsh
```
```
chsh -s /bin/zsh
```

#### ohmyzsh

```
sh -c "$curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
```

#### ohmyposh

```
yay -S oh-my-posh
```

#### zinit
```
sudo pacman -S zoxide
```
```
git clone https://github.com/zdharma-continuum/zinit.git $HOME/.local/share/zinit/zinit.git
```
```
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
```
```
source $HOME/.zshrc
```

### Removing files to make links later
```
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

```

### Symbolic File Links

```
ln -s $HOME/.dots/.zshrc $HOME/

ln -s $HOME/.dots/.tmux $HOME/

ln -s $HOME/.dots/.tmux.conf $HOME/

ln -s $HOME/.dots/.config/fastfetch $HOME/.config/

ln -s $HOME/.dots/.config/ohmyposh $HOME/.config/

ln -s $HOME/.dots/.config/nvim $HOME/.config/

ln -s $HOME/.dots/.config/hypr $HOME/.config/

ln -s $HOME/.dots/.config/hypr-stuff $HOME/.config/

ln -s $HOME/.dots/.config/keyd $HOME/.config/

ln -s $HOME/.dots/.config/kitty $HOME/.config/

ln -s $HOME/.dots/.config/mpd $HOME/.config/

ln -s $HOME/.dots/.config/rmpc $HOME/.config/

ln -s $HOME/.dots/.config/rofi $HOME/.config/

ln -s $HOME/.dots/.config/swaync $HOME/.config/

ln -s $HOME/.dots/.config/waybar $HOME/.config/

ln -s $HOME/.dots/.config/wlogout $HOME/.config/
```
### Github setup
```
git config --global user.name spample
```
```
git config --global user.email luis.antonio.gonzalez501@gmail.com
```
```
git config --global init.defaultBranch main
```
### Github ssh setup
```
eval "$(ssh-agent -s)"
```
```
ssh-keygen -t ed25519 -C luis.antonio.gonzalez501@gmail.com
```
```
xclip -selection clipboard $HOME/.ssh/id_ed25519.pub 
```
```
ssh -T git@github.com
```
### sddm
```
https://github.com/uiriansan/SilentSDDM
```

```
yay -S sddm-silent-theme
```





```
sudo pacman -S --needed sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
```

```
sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
```

```
sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
```

####  If you dont have a sddm.conf in /etc/

```
sudo sddm --example-config | sudo tee /etc/sddm.conf > /dev/null

```
```
[Theme]
Current=sddm-astronaut-theme``
```

```
sudo -e /etc/sddm.conf.d/virtualkbd.conf
```
```
echo "[General]                         
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf
```
edit the 'ConfigFile=' section to change theme
```
sudo -e /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
```
metadata.desktop
```
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

```
sudo cp ~/.dots/misc/man-with-jellyfish-in-space.mp4 /usr/share/sddm/themes/sddm-astronaut-theme/background/
```
copy the conf file into the themes
```
sudo cp ~/dots/misc/man-with-jelly.conf /usr/share/sddm/themes/sddm-astronaut-theme/Themes/
```
to Test theme use 
```
sddm-greeter-qt6 --test-mode --theme /usr/share/sddm/themes/sddm-astronaut-theme/
```
### Music
```
sudo pacman -S timidity++
sudo mkdir -p /etc/timidity
sudo cp /usr/share/timidity/timidity.cfg /etc/timidity/
```
##  keyd installation

```
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
```
symlink into system shortcuts

```
sudo ln -s ~/.dots/.config/keyd/default.conf /etc/keyd/
```




# Stow:
```
sudo pacman -S --needed stow
```

then run `stow .` from the dots directory

make sure to have the dots on the home directory

## GTK Theme

```
mkdir -p ~/.themes
cd ~/.themes
git clone https://github.com/EliverLara/Nordic.git
```
```
sudo mv Nordic /usr/share/themes/
```
### apps I use

```
sudo pacman -S --needed hyprpaper waybar hyprlock hypridle keyd mpd rmpc neovim rofi swaync qt6ct tmux
```
```
yay -S wlogout
```
