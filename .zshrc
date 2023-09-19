
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

# PROMPT='%n@%m %~ $ '

alias tetrio="tetrio-plus-bin"
alias cls="clear"
alias show-battery="cat /sys/class/power_supply/BAT1/capacity"
alias pokec="pokemon-colorscripts"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=~/eww/target/release:$PATH

export STARSHIP_CONFIG=~/.dotfiles/starship/startship.toml
eval "$(starship init zsh)"


# shiny=$((RANDOM % 500))

# if [ $shiny -eq 1 ]; then
#     pokec -r -s | sed 's/./\U&/'
#     echo "Shiny!" | lolcat -v 3 -h 3
# else
#     pokec -r | sed 's/./\U&/'
# fi