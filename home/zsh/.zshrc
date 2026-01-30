HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/inva/.zshrc'

autoload -Uz compinit
compinit

export GPG_TTY=$(tty)

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/Coding/flutter/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export N_PREFIX="$HOME/.n"
export PATH="$HOME/.n/bin:$PATH"

if command -v brew &>/dev/null; then
    share_dir="/opt/homebrew/share"
else
    share_dir="/usr/share/zsh/plugins"
fi

export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=red,bg=crust"
export HISTORY_SUBSTRING_SEARCH_FUZZY=true
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

. "$share_dir/zsh-autosuggestions/zsh-autosuggestions.zsh"
. "$share_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
. "$share_dir/zsh-history-substring-search/zsh-history-substring-search.zsh"

export PATH="$HOME/Coding/funtoo-metatools/bin:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
export PYTHONPATH="$HOME/Coding/subpop:$HOME/Coding/funtoo-metatools"

alias hg="kitty +kitten hyperlinked_grep"

alias ls="eza"
alias ssh="kitty +kitten ssh"
alias clip="kitty +kitten clipboard"
alias nyx="doas -u tor nyx"
alias hg="kitty +kitten hyperlinked_grep"

alias cdr='cd $(git rev-parse --show-toplevel)'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

setopt auto_cd

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

eval "$(starship init zsh)"

if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

# pnpm
export PNPM_HOME="/Users/inva/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Android SDK
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"
