
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/aaron/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install

PROMPT='%n@%m %~ $ '

alias tetrio="tetrio-plus-bin"
alias cls="clear"
