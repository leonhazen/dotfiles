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

### asdf

Includes [asdf](https://asdf-vm.com/) for managing runtime versions. 

Versions to install and global setting are configured in `install.conf.yaml` but can be managed directly using `asdf`.

Use `asdf install python <version>` or `asdf install nodejs latest` to install runtimes, and `asdf global golang <version>` to specify global versions. 

When installing/switching versions, you probably want to run `asdf reshim <language>`

#### asdf troubleshooting
If ./install (or other sources) return errors about runtimes managed by 'asdf' like the below: 

```
/Users/leon/.asdf/shims/python: line 6: /usr/local/Cellar/asdf/0.10.2/libexec/bin/asdf: No such file or directory
/Users/leon/.asdf/shims/python: line 6: exec: /usr/local/Cellar/asdf/0.10.2/libexec/bin/asdf: cannot execute: No such file or directory
```

This can be caused by homebrew upgrades of asdf breaking the currently linked shims. You can force asdf to recreate all your shims with their correct paths with the below:

```sh
rm ~/.asdf/shims/*
asdf reshim
```

## Useful aliases/functions

`keychain.sh [set|get] [key]` - store secrets in OSX keychain, useful for populating env vars like `export ENV_VAR_NAME=$(keychain.sh get ENV_VAR_NAME)`

`ath` - function to switch Alacritty theme

`gig` - gitignore helper function

`tm` - tmux session helper function

## Updating Dotbot

In short, dotbot submodule can be updated with `git submodule update --remote dotbot`. Make sure to commit, and then run `./install` again.

See https://github.com/anishathalye/dotbot for more info.

