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

For tmux, launch tmux and ctrl+A I to install TPM plugins. 
>If your username (or more to the point, your HOME path) has a space in it, this seems to break the TPM install hotkey working, instead you can manually run `~/.tmux/plugins/tpm/bin/install_plugins`.

### Updating Dotbot

In short, dotbot submodule can be updated with `git submodule update --remote dotbot`. Make sure to commit, and then run `./install` again.

See https://github.com/anishathalye/dotbot for more info.

## VS Code

VS Code config is synced via the built-in sync function. This is using my github account for auth.

## asdf

Includes [asdf](https://asdf-vm.com/) for managing runtime versions. Use `asdf install python <version>` or `asdf install nodejs latest` to install runtimes.

## Troubleshooting

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