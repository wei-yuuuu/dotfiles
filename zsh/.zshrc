# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

# Theme
ZSH_THEME="spaceship"

# Command auto-correction.
ENABLE_CORRECTION="false"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup
plugins=(git node brew tmux zsh-autosuggestions)

# User configuration
# Hide user@hostname if it's expected default user
DEFAULT_USER=""
prompt_context(){}

# Set default editor to nvim
export EDITOR='nvim'

# Aliases
alias cls='clear'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias ll='ls -1a'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles='find . -name '.DS_Store' -type f -delete'
alias npm-update='npx npm-check -u'

# Custom functions
mg () { mkdir "$@" && cd "$@" || exit; }

# fzf
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS='
  --height 40% --layout=reverse --border --extended
  --color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

gst() {
  git -c color.status=always status --short |
  fzf --height 50% --border --ansi --multi --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

glo() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

# Enabled zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh

# Enabled true color support for terminals
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Set Spaceship as prompt
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_CHAR_SYMBOL='𝝺 '
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_GIT_STATUS_STASHED=''
SPACESHIP_EXEC_TIME_COLOR='cyan'
