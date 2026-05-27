if [ -z "$TMUX" ]; then
    (cat ~/.cache/wal/sequences &)
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export GOPATH="$HOME/Projects/go"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.npm-global/bin:/usr/local/go/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.dotnet:$PATH"
export DOTNET_ROOT=$HOME/.dotnet
export DOCKER_BUILDKIT=1

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}No matches%f'
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

alias zshconfig="source ~/.zshrc"
alias c='clear'
alias e='exit'
alias fd='fd'
alias lg='lazygit'
alias vi='nvim'
alias vim='nvim'
alias v='nvim'
alias k='kubectl'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
eval "$(zoxide init zsh)"

# #Pywal
wal-swww() {
    wal -n -s -i "$@"
    awww img "$(< "${HOME}/.cache/wal/wal")" --transition-type any --transition-fps 60 --transition-duration 2
    cp ~/.cache/wal/colors-mako ~/.config/mako/config
    makoctl reload
    pkill waybar; nohup waybar >/dev/null 2>&1 &
}

if [ -f ~/.cache/wal/colors-tty.sh ]; then
    source ~/.cache/wal/colors-tty.sh
fi

# Pywal syntax highlighting colors (must load after oh-my-zsh which loads the plugin)
[ -f ~/.cache/wal/colors-zsh.sh ] && source ~/.cache/wal/colors-zsh.sh

# Autosuggestion color from pywal
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
unset zle_bracketed_paste
export PATH="$HOME/.npm-global/bin:$PATH"

# OpenClaw Completion
[ -f "$HOME/.openclaw/completions/openclaw.zsh" ] && source "$HOME/.openclaw/completions/openclaw.zsh"
export PATH="$PATH:$HOME/.dotnet/tools"
