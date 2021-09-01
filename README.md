# dotfiles

These files are structured for [configuring Codespaces](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account#dotfiles). There are also instructions on how to bootstrap a new machine.

## Supported tools

### Shells

#### [fish](https://fishshell.com/)

Primary shell; assumes [Starship](https://starship.rs/) is installed.

Backup prompt functions available for when Starship is unavailable.


#### [zsh](https://zsh.sourceforge.io/)

macOS default; configured as backup for when fish isn't used.


#### [bash](https://www.gnu.org/software/bash/)

Linux/Codespaces default; configured as backup for when fish or zsh aren't used.


### [Git](https://git-scm.com/)

Both `.gitconfig` and `.git_`.


### [Vim](https://www.vim.org/)

For when [VS Code](https://code.visualstudio.com/) isn't available.


### [Starship](https://starship.rs/)

Assumes that the [Python Launcher for Unix](https://github.com/brettcannon/python-launcher) is installed.


## Bootstrapping a new machine

### Unix

#### WSL

1. Clone this repo.
1. Install [Homebrew](https://brew.sh/).
1. `brew bundle install`
1. **COPY** `.gitconfig` and uncomment relevant credential manager line.
1. Symlink all other appropriate files and directories from this repo.


#### macOS

1. Clone this repo.
1. Install [Homebrew](https://brew.sh/).
1. `brew bundle install`
1. `brew bundle install --file Brewfile.macos`
1. Symlink all appropriate files and directories from this repo.
1. Install [1password](https://1password.com/)
1. Install [Firefox](https://www.mozilla.org/en-CA/firefox/new/)
1. Install [Mozilla VPN](https://www.mozilla.org/)
1. Install [Signal](https://signal.org/)


### Windows

1. Install [1password](https://1password.com/)
1. Install [Firefox](https://www.mozilla.org/en-CA/firefox/new/)
1. Install [Mozilla VPN](https://www.mozilla.org/)
1. Install [Signal](https://signal.org/)
