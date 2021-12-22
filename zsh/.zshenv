ZDOTDIR=$HOME/.config/zsh

# oh my zsh settings
ZSH=${HOME}/.config/oh-my-zsh

# Setup homebrew environment variables
if [ -x /opt/homebrew/bin/brew ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
fi

