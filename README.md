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
ln -s ~/Documents/Dots-laptop/.zshrc ~/.zshrc

ln -s ~/Documents/Dots-laptop/.wezterm.lua ~/.wezterm.lua

ln -s ~/Documents/Dots-laptop/fastfetch/config.jsonc ~/.config/fastfetch

ln -s ~/Documents/Dots-laptop/ohmyposh/Nord-v2.json ~/.config/ohmyposh/


```
#### nvim-main
```

ln -s ~/Documents/Dots-laptop/nvim/.neoconf.json  ~/.config/nvim/

ln -s ~/Documents/Dots-laptop/nvim/init.lua  ~/.config/nvim/

ln -s ~/Documents/Dots-laptop/nvim/lazy-lock.json  ~/.config/nvim/

ln -s ~/Documents/Dots-laptop/nvim/lazyvim.json  ~/.config/nvim/

ln -s ~/Documents/Dots-laptop/nvim/LICENSE  ~/.config/nvim/

ln -s ~/Documents/Dots-laptop/nvim/README.md  ~/.config/nvim/

ln -s ~/Documents/Dots-laptop/nvim/stylua.toml  ~/.config/nvim/

```
#### nvim-plugins

```
ln -s ~/Documents/Dots-laptop/nvim/lua/plugins/catppuccin.lua ~/.config/nvim/lua/plugins

ln -s ~/Documents/Dots-laptop/nvim/lua/plugins/golfNvim.lua ~/.config/nvim/lua/plugins

ln -s ~/Documents/Dots-laptop/nvim/lua/plugins/lsp.lua ~/.config/nvim/lua/plugins

ln -s ~/Documents/Dots-laptop/nvim/lua/plugins/lualine.lua ~/.config/nvim/lua/plugins

ln -s ~/Documents/Dots-laptop/nvim/lua/plugins/platformio.lua ~/.config/nvim/lua/plugins

```

#### nvim-config
```

ln -s ~/Documents/Dots-laptop/nvim/lua/config/autocmds.lua ~/.config/nvim/lua/config

ln -s ~/Documents/Dots-laptop/nvim/lua/config/keymaps.lua ~/.config/nvim/lua/config

ln -s ~/Documents/Dots-laptop/nvim/lua/config/lazy.lua ~/.config/nvim/lua/config

ln -s ~/Documents/Dots-laptop/nvim/lua/config/options.lua ~/.config/nvim/lua/config

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





