# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

export PATH="$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':')$PATH"

export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export EDITOR="nvim"
export BIB="$HOME/Dropbox/latex/uni.bib"

if [[ "$(tty)" == '/dev/tty1' ]]; then
exec startx
fi
