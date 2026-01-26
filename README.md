# Termux!

pkg update && pkg upgrade


pkg install git clang zsh zoxide termux-services neovim openssh oh-my-posh make fastfetch fakeroot curl ripgrep termux-api

# zinit install

make dir
```bash
mkdir -p ~/.local/share/zinit
```

git clone
```bash
git clone https://github.com/zdharma-continuum/zinit.git $HOME/.local/share/zinit/zinit.git
```
delete stuff
```bash
rm .bash_history
```
Github
```bash
git config --global user.name spample
```
```bash
git config --global user.email luis.antonio.gonzalez501@gmail.com
```
```bash
git config --global init.defaultBranch main
```

ssh key
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

