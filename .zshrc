# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep nomatch
unsetopt appendhistory extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/abusque/.zshrc'

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit
# End of lines added by compinstall

prompt walters
export EDITOR=emacs
alias ls='ls --color=auto'
alias ll='ls -lh'

# This is to make the delete key behave as expected
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char
