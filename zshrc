# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
# eval "$(oh-my-posh init zsh)"
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PS1='$ '
export PATH=/usr/local/bin:$PATH

# Export colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export TERM='xterm-256color'
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Format alias for git log
# ...

# Increase the number of lines saved in memory (in-session)
export HISTSIZE=10000
# Number of commands to save to the history file across reboots
export SAVEHIST=10000
# File where history is stored
export HISTFILE=~/.zsh_history
# Ensure history is shared and appended immediately across multiple sessions
setopt SHARE_HISTORY INC_APPEND_HISTORY

# Created by `pipx` on 2026-02-25 15:28:07
export PATH="$PATH:/Users/dsp_shp/.local/bin"
alias code="open -a \"Code\""
