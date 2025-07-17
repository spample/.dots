#   Instructions


### Update packages
```
sudo pacman -Syu
```

### Create your fonts directory

```
mkdir -p ~/.local/share/fonts
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
unzip /tmp/FiraCode.zip -d ~/.local/share/fonts/FiraCode
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
### makes github dir
```
mkdir -p ~/Documents/github
cd ~/Documents/github
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

fastfetch --gen-config

rm ~/.config/fastfetch/config.jsonc
```

### Installing Zsh, ohmyposh, zinit 

#### Zsh
```
sudo pacman -S zsh
```
```
chsh -s /bin/zsh
```

#### ohmyposh
```
cd ~/Documents/github
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
```
```
sudo pacman -S base-devel
```
```
makepkg -si
```
#### zinit
```
sudo pacman -S zoxide
```
```
git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/zinit.git
```
```
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
```
```
source ~/.zshrc
```

### Removing files to make links later
```
rm ~/.bashrc
rm ~/.bash_history
rm ~/.bash_logout
rm ~/.bash_profile

rm ~/.wezterm.lua
rm ~/.config/fastfetch/config.jsonc
rm ~/.config/starship.toml
```


### Symbolic File Links

```
ln -s ~/Documents/Linux-Terminal-Customization-computer/.zshrc ~/.zshrc

ln -s ~/Documents/Linux-Terminal-Customization-computer/.wezterm.lua ~/.wezterm.lua

ln -s ~/Documents/Linux-Terminal-Customization-laptop/fastfetch/config.jsonc ~/.config/fastfetch

ln -s ~/Documents/Linux-Terminal-Customization-computer/ohmyposh/Nord-v2.json ~/.config/ohmyposh/

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
xclip -selection clipboard ~/.ssh/id_ed25519.pub 
```
```
ssh -T git@github.com
```





