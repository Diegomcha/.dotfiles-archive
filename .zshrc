# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autocomplete for ZSH
source ~/.dotfiles/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Vanilla ZSH settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# PowerLevel10k
source ~/.dotfiles/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Replaces trash command to include clear subcommand
function trash() {
  case $1 in
    --empty)
      trash-empty
      ;;
    *)
    command trash "$@";;
  esac
}

# Replace rm with a safer command
if [ "$(command -v trash)" ]; then
  unalias -m 'rm'
  alias rm='trash'
fi

# Replace ls
if [ "$(command -v exa)" ]; then
    unalias -m 'll'
    unalias -m 'l'
    unalias -m 'la'
    unalias -m 'ls'
    alias ls='exa -G  --color auto --icons -s type'
    alias ll='exa -l --color always --icons -a -s type'
fi
# Replace cat
if [ "$(command -v batcat)" ]; then
  unalias -m 'cat'
  alias cat='batcat --theme="OneHalfDark"'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
