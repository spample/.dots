# Create your fonts directory

mkdir -p ~/.local/share/fonts

# Download the font directly from the Nerd Fonts project
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -O /tmp/FiraCode.zip

# Unzip
unzip /tmp/FiraCode.zip -d ~/.local/share/fonts/FiraCode

# Refresh the font cache
fc-cache -fv

# Verify the font is installed
fc-list | grep "FiraCode Nerd Font Mono"





# if you want more fonts, run this


# makes github dir
mkdir -p ~/github

# Installs font bulk download & downloads it ~2-3 GB!

git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh


# installing FastFetch
cd ~/Downloads
wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb
sudo nala install ./fastfetch-linux-amd64.deb


# Beutiful Bash 

cd ~/github
git clone https://github.com/christitustech/mybash
cd mybash
./setup.sh


# Removing files to make links later

rm /home/spample/.bashrc
rm /home/spample/.wezterm.lua
rm /home/spample/.config/fastfetch/config.jsonc
rm /home/spample/.config/starship.toml

# removing linuxtoolbox

rmdir ~/linuxtoolbox


# Symbolic File Links

ln -s /home/spample/Linux-Terminal-Customization-computer/.bashrc /home/spample/.bashrc

ln -s /home/spample/Linux-Terminal-Customization-computer/.wezterm.lua /home/spample/.wezterm.lua

ln -s /home/spample/Linux-Terminal-Customization-computer/config.jsonc /home/spample/.config/fastfetch/config.jsonc

ln -s /home/spample/Linux-Terminal-Customization-computer/starship.toml /home/spample/.config/starship.toml

# Github setup

git config --global user.name spample
git config --global user.email luis.antonio.gonzalez501@gmail.com
git config --global init.defaultBranch main

# Github ssh setup

eval "$(ssh-agent -s)"
ssh-keygen -t ed25519 -C luis.antonio.gonzalez501@gmail.com
xclip -selection clipboard ~/.ssh/id_ed25519.pub 


ssh -T git@github.com








