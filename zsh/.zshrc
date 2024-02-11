# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

# XDG Base Directory Specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# zap
[ -f "${XDG_DATA_HOME}/zap/zap.zsh" ] && source "${XDG_DATA_HOME}/zap/zap.zsh" #zap plugin manager

# history
HISTFILE=~/.zsh_history

# source 
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/functions.zsh"
# plugins
plug "romkatv/powerlevel10k" #prompt
plug "zsh-users/zsh-syntax-highlighting" #Fish like syntax highlighting
plug "zsh-users/zsh-autosuggestions" #Fish-like autosuggestions for zsh
plug "zap-zsh/vim" #A simple vim plugin for zsh
plug "esc/conda-zsh-completion" #Zsh completion for conda
#plug "zap-zsh/zap-prompt" #DIY not NOW! #TODO

# fzf
[ -f ~/.config/fzf/fzf.zsh ] && source ~/.config/fzf/fzf.zsh #fzf must be installed in $HOME/.local/src/
# keybinds
bindkey -s "^Y" 'ya^M' #yazi
bindkey ',' autosuggest-accept #zsh-autosuggestions

#neofetch --memory_percent on #Display system info
