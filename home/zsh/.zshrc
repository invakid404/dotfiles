HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/inva/.zshrc'

autoload -Uz compinit
compinit

export GPG_TTY=$(tty)
export PATH="$HOME/Coding/funtoo-metatools/bin:$PATH"
export PYTHONPATH="$HOME/Coding/funtoo-metatools"

alias ls="exa"

. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

eval "$(starship init zsh)"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/usr/lib64/kitty/shell-integration/kitty.zsh"; then source "/usr/lib64/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION
