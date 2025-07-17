#######################################
#  ENVIRONMENT SETUP
#######################################
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

ZSH_DISABLE_COMPFIX=true
ZSH_THEME=""
DISABLE_UNTRACKED_FILES_DIRTY="true"
ENABLE_CORRECTION="true"

# History behavior
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Fix Ctrl-S freezing terminal (enables Ctrl-R & Ctrl-S for search)
[[ $- == *i* ]] && stty -ixon

#######################################
#  HISTORY AUTO-SAVE HOOK
#######################################
autoload -Uz add-zsh-hook
save_history_to_file() {
  builtin history -a > /dev/null 2>&1
}
add-zsh-hook precmd save_history_to_file

#######################################
#  ALIASES
#######################################
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

alias alienfxgui='/usr/bin/python3 ~/Documents/github/Dell-G-Series-Controller/main.py'


#######################################
#  FUNCTIONS
#######################################

# Extract compressed files
extract() {
  for archive in "$@"; do
    if [ -f "$archive" ]; then
      case $archive in
        *.tar.bz2) tar xvjf "$archive" ;;
        *.tar.gz)  tar xvzf "$archive" ;;
        *.bz2)     bunzip2 "$archive" ;;
        *.rar)     rar x "$archive" ;;
        *.gz)      gunzip "$archive" ;;
        *.tar)     tar xvf "$archive" ;;
        *.tbz2)    tar xvjf "$archive" ;;
        *.tgz)     tar xvzf "$archive" ;;
        *.zip)     unzip "$archive" ;;
        *.Z)       uncompress "$archive" ;;
        *.7z)      7z x "$archive" ;;
        *)         echo "'$archive' cannot be extracted" ;;
      esac
    fi
  done
}

# Copy with progress bar
cpp() {
  set -e
  strace -q -ewrite cp -- "$1" "$2" 2>&1 |
  awk '{
    count += $NF
    if (count % 10 == 0) {
      percent = count / total_size * 100
      printf "%3d%% [", percent
      for (i=0;i<=percent;i++) printf "="
      printf ">"
      for (i=percent;i<100;i++) printf " "
      printf "]\r"
    }
  }
  END { print "" }' total_size="$(stat -c '%s' "$1")" count=0
}

# Auto-ls after cd
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ls
  else
    builtin cd ~ && ls
  fi
}

#######################################
#  ZINIT PLUGINS (LAZY LOADING)
#######################################

# Autosuggestions (immediate)
zinit ice lucid
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting (must be last, lazy OK)
zinit ice lucid wait'1'
zinit light zsh-users/zsh-syntax-highlighting

# zoxide
zinit ice wait lucid
zinit light ajeetdsouza/zoxide

# fzf
zinit ice wait lucid
zinit light junegunn/fzf

# you-should-use
zinit ice wait lucid
zinit light MichaelAquilina/zsh-you-should-use

# Oh My Zsh plugin snippets (lazy loaded)
zinit ice wait lucid
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

zinit ice wait lucid
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh

zinit ice wait lucid
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice wait lucid
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/python/python.plugin.zsh

zinit ice wait lucid
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/pip/pip.plugin.zsh

zinit ice wait lucid
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/npm/npm.plugin.zsh

#######################################
#  PROMPT & TOOLS
#######################################
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/Nord-v2.json)"
fastfetch

#######################################
#   Keybinds
#######################################
autoload -U select-word-style
select-word-style bash
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3~" delete-char

bindkey "^[[3;5~" kill-word
bindkey "^[[3;3~" kill-word

export XCURSOR_THEME=Nordic-cursors
export XCURSOR_SIZE=36
export SUDO_EDITOR=nvim

export SUDO_EDITOR=nvim

# Smart edit command:
vi() {
  if [[ "$1" == /* && ! -w "$1" && -f "$1" ]]; then
    # If it's an absolute path, not writable, and is a file → use sudoedit
    sudoedit "$@"
  else
    nvim "$@"
  fi
}

export PATH="$HOME/.platformio/penv/bin:$PATH"



export PATH="$HOME/.local/bin:$PATH"

