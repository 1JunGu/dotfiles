#!/bin/sh
# Commands
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/self_bin:$PATH #self_defined excute command

# rustup shell setup
# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"$HOME/.cargo/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac

# Editors
export EDITOR=nvim

case "$(uname -s)" in
Linux)
#WSL2 or Centos
    case "$(cat /proc/version)" in
        *microsoft*) ;;
        *centos*) ;; 
	  *) ;;
    esac
    ;;
Darwin)
##mac os
    #brew path
    export PATH=/usr/local/bin:$PATH
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
    #nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"   # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ;;  # This loads nvm bash_completion
*)
    ;;
esac


eval "$(zoxide init zsh)" #zoxide
eval "$(atuin init zsh --disable-up-arrow)"  #atuin SQLite shell history

# History
HISTSIZE=1000000
SAVEHIST=1000000
setopt correct_all              # Correction
setopt BANG_HIST                # Treat the '!' character specially during expansion
setopt EXTENDED_HISTORY         # Write the history file in the ":start:elapsed;command" format
setopt INC_APPEND_HISTORY       # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY            # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS         # Don't record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS     # Delete old recorded entry if new entry is a duplicate
setopt HIST_FIND_NO_DUPS        # Don't display a line previously found while use Ctrl+R or arrows command
setopt HIST_IGNORE_SPACE        # Don't record an entry starting with a space
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries in history file
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks before recording entry
setopt HIST_VERIFY              # Don't excute immediately upon history expansion

setopt autocd # auto cd without cd prefix
#completion
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
_comp_options+=(globdots)               # Include hidden files.

#autoload -Uz colors && colors

# conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<< 
# conda config --set auto_activate_base false ##time consuming large, disable it
