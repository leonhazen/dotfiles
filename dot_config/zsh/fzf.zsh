# Setup fzf
# ---------
FZFPATH="$(brew --prefix)/opt/fzf"

if [[ ! "$PATH" == */opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$FZFPATH/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZFPATH/shell/completion.zsh" 2>/dev/null

# Key bindings
# ------------
source "$FZFPATH/shell/key-bindings.zsh"
