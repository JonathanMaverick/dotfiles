export GOPATH="$HOME/Projects/go"
export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/go/bin:$HOME/.local/bin:$GOPATH/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

alias zshconfig="source ~/.zshrc"
alias c='clear'
alias e='exit'
alias fd='fdfind'
alias lg='lazygit'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
eval "$(zoxide init zsh)"

# #Pywal
wal-swww() {
    wal -n -i "$@"
    swww img "$(< "${HOME}/.cache/wal/wal")" --transition-type any --transition-fps 60 --transition-duration 2
    cp ~/.cache/wal/colors-mako ~/.config/mako/config
    makoctl reload
}

if [ -z "$TMUX" ]; then
    (cat ~/.cache/wal/sequences &)
fi

if [ -f ~/.cache/wal/colors-tty.sh ]; then
    source ~/.cache/wal/colors-tty.sh
fi

fastfetch
