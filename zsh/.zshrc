# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

#Name of the theme to load
ZSH_THEME="spaceship"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup
plugins=(git node brew tmux)

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

## git aliases
alias gs='git status'

# Custom functions
mg () { mkdir "$@" && cd "$@" || exit; }

# fzf
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --extended'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

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
