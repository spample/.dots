#   Instructions
### WSL new user
```bash
pacman -Sy --needed sudo

useradd -m -G wheel -s /bin/bash spample
```
#### Set new password
```bash
passwd spample
```
#### Allow wheel group to use sudo (uncomment this "%wheel ALL=(ALL) ALL")
```bash
EDITOR=nvim visudo
```
#### Switch to the new user
```bash
su - spample
```
#### Make WSL automatically log into the new user
```bash
nvim /etc/wsl.conf
```
add this next part
```bash
[user]
default=spample
```
restart wsl in windows terminal
```bash
wsl --shutdown
```

---

### Update packages
```bash
sudo pacman -Syu
```
### Installing yay
```bash
mkdir -p $HOME/Documents/github
cd $HOME/Documents/github
git clone https://aur.archlinux.org/yay.git
```
```bash
cd yay
makepkg -si 
```

### apps I use
```bash
sudo pacman -S --needed neovim tmux nodejs-lts-iron npm clang xorg-xhost openssh unzip git base-devel fastfetch stow noto-fonts-emoji zip sl cmake wget wl-clip-persist
```
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
### Installing Zsh, ohmyzsh, ohmyposh, zinit
#### Zsh
```bash
sudo pacman -S zsh
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
```
# Stow:
run `stow .` from the dots directory

make sure to have the dots on the home directory


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
```bash
git config --global credential.helper store
```
### Github ssh setup
```bash
eval "$(ssh-agent -s)"
```
```bash
ssh-keygen -t ed25519 -C luis.antonio.gonzalez501@gmail.com
```
```bash
xclip -selection clipboard $HOME/.ssh/id_ed25519.pub 
```
```bash
ssh -T git@github.com
```
### nvm thingy
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
```
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
