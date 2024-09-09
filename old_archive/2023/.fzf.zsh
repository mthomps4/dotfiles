# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/mthomps4/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/mthomps4/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/mthomps4/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/mthomps4/.fzf/shell/key-bindings.zsh"
