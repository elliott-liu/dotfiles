# Set Variables
# Syntax highlighting for man (manual) pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Bypass MacOS Gatekeeper for Homebrew Cask Installs
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Change ZSH Options

# Create Aliases
alias ls='ls -lAFh'

# Customize Prompt(s)
PROMPT='
%1~ %L %# 
> '

RPROMPT='%*'

# Add Locations to $PATH Variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Write Handy Functions
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# Use ZSH Plugins

# ...and Other Suprises