# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jungu/.local/src/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/jungu/.local/src/fzf/bin"
fi

# Auto-completion
# ---------------
source "/Users/jungu/.local/src/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/Users/jungu/.local/src/fzf/shell/key-bindings.zsh"
