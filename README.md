# Leon's dotfiles

## Prerequisites
1. [Homebrew](https://brew.sh/)

    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2. git SSH key created and added to github account
    1. `ssh-keygen -t ed25519 -C "your_email@example.com"`
    2. Copy from `~/.ssh/id_ed25519.pub` into https://github.com/settings/ssh/new

## Installation

```bash
git clone git@github.com:leonhazen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule update --recursive --init
./install
```

## App specific config

### tmux
tmux plugins are installed via TPM. Launch tmux and ctrl+A I to install TPM plugins. 

### VSCode

VS Code config is synced via the built-in sync function. This is using my github account for auth. Currently both insiders and standard are syncing with the standard core profile.

## Useful aliases/functions

`keychain.sh [set|get] [key]` - store secrets in OSX keychain, useful for populating env vars like `export ENV_VAR_NAME=$(keychain.sh get ENV_VAR_NAME)`

`ath` - function to switch Alacritty theme

`gig` - gitignore helper function

`tm` - tmux session helper function

## Updating Dotbot

In short, dotbot submodule can be updated with `git submodule update --remote dotbot`. Make sure to commit, and then run `./install` again.

See https://github.com/anishathalye/dotbot for more info.

