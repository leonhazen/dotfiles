source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
source_if_exists "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 

##### options
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt appendhistory        # Append history instead of overwriting.
setopt sharehistory         # Share history across terminals.
setopt incappendhistory     # Immediately append to the history file, not just when a term is killed.
setopt hist_ignore_all_dups # If a new command is a duplicate of the previous one, remove the older one from the history list.
setopt hist_save_no_dups    # Do not write command lines that are duplicates of the previous one.
setopt hist_ignore_dups     # Do not record an entry that was just recorded again.
setopt hist_find_no_dups    # Do not display a line previously found.

##### completions / app helpers
autoload -U +X bashcompinit && bashcompinit
autoload -U compinit && compinit

# fzf
source_if_exists $ZDOTDIR/fzf.zsh

# terraform
complete -o nospace -C /usr/local/bin/terraform terraform

# mcfly for better searching of history with ctrl+R
eval "$(mcfly init zsh)"

# set up 'fuck' alias for thefuck corrections
eval $(thefuck --alias)

# 'navi' for ctrl+G cheatsheets
export NAVI_CONFIG="$HOME/.config/navi/config.yaml"
eval "$(navi widget zsh)"

# Start ssh-agent if it's not running
if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
    if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
        # Auto-add ssh keys to your ssh agent
        # Example:
        # ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
    fi
fi

##### PATH
export PATH=$PATH:~/Library/Android/sdk/platform-tools      # android studio
export PATH=$PATH:~/Library/Android/sdk/cmdline-tools/bin   # android studio
export PATH=$PATH:~/.local/bin                              # poetry
export GOPATH=$HOME/go                                      # go
export PATH=$PATH:$(go env GOPATH)/bin                      # go

##### my custom bits
# my scripts
export PATH=$PATH:~/.utils

# Get private env vars from OSX keychain
export OPENAI_API_KEY=$(keychain.sh get OPENAI_API_KEY)

# Options for alias mappings
export USE_VSCODE_INSIDERS=1

# my aliases
source_if_exists $ZDOTDIR/aliases.zsh

# my functions
source_if_exists $ZDOTDIR/functions.zsh

# install and load zsh plugins
plugin_repos=(
    romkatv/powerlevel10k
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
)

# plugin-load is defined in functions.zsh and it's 👌🏻
plugin-load $plugin_repos

source_if_exists $ZDOTDIR/.p10k.zsh