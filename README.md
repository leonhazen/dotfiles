# Leon's dotfiles

This repo uses [chezmoi](https://github.com/twpayne/chezmoi) to manage dotfiles.

## Prerequisites
1. [Homebrew](https://brew.sh/)

    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2. git SSH key created and added to github account
    1. `ssh-keygen -t ed25519 -C "your_email@example.com"`
    2. Copy from `~/.ssh/id_ed25519.pub` into https://github.com/settings/ssh/new

## Installation
Not yet tested but chezmoi offers a 1 line install and apply command. I think this will be the way to go so that it's (mostly) platform independent.
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply leonhazen
```

Otherwise, install chezmoi using your package manager and use it to init from this github source.
```bash
brew install chezmoi
chezmoi init https://github.com/leonhazen/dotfiles.git
```

Then check what changes it would make.
```bash
chezmoi diff
```

And if you're happy with the changes, apply them.
```bash
chezmoi apply -v
```

## App specific config

### LG TV
Hammerspoon is used to call LUA scripts on Macbook wake/sleep events. Need to auth the machine with the TV first using `lgtv auth 192.168.1.139 MyTV ssl`.

If that IP changes (it's currently DHCP reserved), need to update it in `lgtv_init.lua`. That also defines the HDMI port used for the laptop connection.

### tmux
tmux plugins are installed via TPM. Launch tmux and ctrl+A I to install TPM plugins. 

### VSCode

VS Code config is synced via the built-in sync function. This is using my github account for auth. Currently both insiders and standard are syncing with the standard core profile.

## Useful aliases/functions

`keychain.sh [set|get] [key]` - store secrets in OSX keychain, useful for populating env vars like `export ENV_VAR_NAME=$(keychain.sh get ENV_VAR_NAME)`

`ath` - function to switch Alacritty theme

`gig` - gitignore helper function

`tm` - tmux session helper function


## TODO
- Auto Brewfile
- Different Brewfiles for work + personal
- Either different GPG keys for work + personal or find best practice for 1 standard one
- WSL profile
- Arch profile
- Template vars
- Encryption
- 1Password