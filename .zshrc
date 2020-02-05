# Enable colors and change prompt:
autoload -U colors && colors

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ci"
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, di{ etc..
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Alex Raw
alias -s tex=nvim
alias -s bib=nvim

alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias h='history 1'
alias l='exa -al --group-directories-first'
alias cp='cp -i'
alias p='sudo pacman'
alias upd='sudo pacman -Syu'
alias clean='sudo pacman -Rns $(pacman -Qqtd)'
alias v='nvim'
alias fm='vifmrun'
alias bib='nvim ~/Dropbox/latex/uni.bib'
alias cheat='nohup $READER ~/Dropbox/teaching/CQP_cheat.pdf & exit'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias bashrc='nvim ~/.bashrc'
alias zshrc='nvim ~/.zshrc'
alias muttrc="nvim ~/.config/mutt/muttrc"
alias lola='cd ~/Dropbox/teaching/19ws_lola_morphology/Uploads'
alias intro='cd ~/Dropbox/teaching/19ws_intro/Uploads'
alias R='R --quiet'
alias i3rc='nvim ~/.config/i3/config'
alias wtr='curl wttr.in/Jena'
alias wtr2='curl v2.wttr.in/Jena'

alias c='cd ~/.config'
alias s='cd ~/.local/bin'
alias d='cd ~/Downloads'
alias D='cd ~/Documents'
alias bm='nvim ~/.config/bookmarks'
alias lit='cd ~/Dropbox/literature'
alias tolino='sudo rsync -ru --progress --stats --delete -- ~/Dropbox/Literature/ /run/media/alexraw/tolino/Books/Papers'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias dmenu='dmenu -nb '#3a3a3a' -sf '#1e1e1e' -sb '#d0bf8f' -nf '#f0dfaf''

VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

setopt autocd

function chpwd() {
    emulate -L zsh
    exa -al --group-directories-first
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/p10k.zsh

# Prompt
# source ~/.config/powerlevel10k/p10k.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

#auto-suggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
set ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=238"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
