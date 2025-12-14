#######################################
#  EARLY ENV (must be first)
#######################################
export ZSH_DISABLE_COMPFIX=true
export XDG_CONFIG_HOME="$HOME/.config"
export ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

#######################################
#  ZINIT
#######################################
source "$ZINIT_HOME/zinit.zsh"

#######################################
#  BASIC ZSH OPTIONS
#######################################
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt AUTO_CD

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

# Fix Ctrl-S freeze
[[ -o interactive ]] && stty -ixon

#######################################
#  ALIASES
#######################################
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias clear='clear && [[ -o interactive ]] && fastfetch'
alias platio='source ~/.platformio/penv/bin/activate'

alias docker-clean='docker container prune -f;
  docker image prune -f;
  docker network prune -f;
  docker volume prune -f'

alias alienfxgui='/usr/bin/python3 ~/Documents/github/Dell-G-Series-Controller/main.py'

#######################################
#  FUNCTIONS
#######################################

# Auto-ls after cd (safe version)
chpwd() { ls }

# Extract archives
extract() {
  for archive in "$@"; do
    [[ -f "$archive" ]] || continue
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
      *)         echo "Cannot extract '$archive'" ;;
    esac
  done
}

# PlatformIO project init
pio-init() {
  [[ -z "$1" ]] && {
    echo "Usage: pio-init <project_name> [pio args]"
    return 1
  }

  local PROJECT_NAME="$1"
  shift

  mkdir -p "$PROJECT_NAME" && cd "$PROJECT_NAME" || return 1
  echo "📂 Created project: $PROJECT_NAME"

  pio project init "$@" || return 1
  pio run -t compiledb || true

  local ENV_NAME SRC
  ENV_NAME=$(grep -oP '(?<=\[env:).*(?=\])' platformio.ini | head -n1)
  SRC=".pio/build/$ENV_NAME/compile_commands.json"

  [[ -f "$SRC" ]] && ln -sf "$SRC" compile_commands.json

  mkdir -p src
  if [[ ! -f src/main.cpp ]]; then
    cat > src/main.cpp <<'EOF'
#include <Arduino.h>

void setup() {
  Serial.begin(9600);
  Serial.println("Hello, PlatformIO!");
}

void loop() {
  delay(1000);
}
EOF
  fi

  nvim src/main.cpp
}

#######################################
#  PATH / ENV
#######################################
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$(go env GOPATH)/bin:$PATH"
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export QT_QPA_PLATFORMTHEME=qt6ct
export SUDO_EDITOR=nvim

#######################################
#  SMART EDITOR
#######################################
vi() {
  if [[ "$1" == /* && ! -w "$1" && -f "$1" ]]; then
    sudoedit "$@"
  else
    nvim "$@"
  fi
}

#######################################
#  ZINIT PLUGINS (FAST + LAZY)
#######################################

# Autosuggestions
zinit ice lucid wait
zinit light zsh-users/zsh-autosuggestions

# zoxide
zinit ice lucid wait
zinit light ajeetdsouza/zoxide

# fzf
zinit ice lucid wait
zinit light junegunn/fzf

# OMZ snippets
zinit ice lucid wait
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

zinit ice lucid wait
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh

zinit ice lucid wait
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh

zinit ice lucid wait
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/python/python.plugin.zsh

zinit ice lucid wait
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/pip/pip.plugin.zsh

zinit ice lucid wait
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/npm/npm.plugin.zsh

#######################################
#  SYNTAX HIGHLIGHTING (MUST BE LAST)
#######################################
zinit ice lucid wait'1' atload'
  typeset -gA ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[command]="fg=#6fcc3d,bold"
  ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#cc3d3d,bold"
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=#d0d18a"
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=#3bdb96"
  ZSH_HIGHLIGHT_STYLES[precommand]="fg=#6fcc3d"
  ZSH_HIGHLIGHT_STYLES[hashed-command]="fg=#9e6cad"
'
zinit light zsh-users/zsh-syntax-highlighting

#######################################
#  PROMPT
#######################################
eval "$(oh-my-posh init zsh --config "$HOME/.config/ohmyposh/Nord-v2.json")"

#######################################
#  KEYBINDS
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

#######################################
#  TOOL SOURCES
#######################################
[[ -o interactive ]] && fastfetch
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

