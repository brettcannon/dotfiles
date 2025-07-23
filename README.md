# dotfiles

These files are structured for [configuring Codespaces](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-codespaces-for-your-account#dotfiles). There are also instructions on how to bootstrap a new machine.

## Supported tools

VS Code is left out thanks to [Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync).

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

1. Clone this repo and run `install`
   1. Install Python
   1. Install Git
1. Install [Homebrew](https://brew.sh/) (Unix and macOS)
1. Set up Fish
   1. [Install](https://fishshell.com/)
   1. Make [fish the default login shell](https://fishshell.com/docs/current/#default-shell)
1. Set up [NextDNS](https://my.nextdns.io/)
1. Install apps
   1. [1Password](https://1password.com/) (include setting up Git commit signing as appropriate)
   1. [Signal](https://signal.org/)
1. Install fonts
   1. [MonoLisa](https://www.monolisa.dev/orders)
   2. [Symbols](https://www.nerdfonts.com/font-downloads)
