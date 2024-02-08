# For any settings that are machine-specific, use universal variables.
# `set`: http://fishshell.com/docs/current/cmds/set.html?highlight=set
# `fish_add_path`: http://fishshell.com/docs/current/cmds/fish_add_path.html

set -g -x CLICOLOR 1
set -g -x CC clang
set -g -x CXX clang++
set -g -x CFLAGS "-Wno-unused-value -Wno-empty-body -Qunused-arguments -Wno-deprecated-declarations"
set -x GPG_TTY (tty)
set -g -x PIP_REQUIRE_VIRTUALENV 1
set -g -x PIP_RESPECT_VIRTUALENV 1
set -g -x MAKEFLAGS (python3 -c "import multiprocessing; print(f'-j{multiprocessing.cpu_count()}')")

set -g -x CDPATH ~/Repositories

# Must come before anything relying on `PATH`.
if test -e /home/linuxbrew/.linuxbrew/bin/brew
  set -g -x HOMEBREW_NO_ENV_HINTS 1
  /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

if test -e ~/.1password/agent.sock
  set -g -x SSH_AUTH_SOCK ~/.1password/agent.sock
else if test -e ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
  set -g -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
end

if test -e ~/.cargo/bin
   fish_add_path -g ~/.cargo/bin
end

if command --search nvim > /dev/null
  alias vim nvim
  echo "vim → nvim"
end

if command --search lsd > /dev/null
  alias ls lsd
  echo "ls → lsd"
end

if command --search code-insiders > /dev/null
  set -g -x EDITOR "code-insiders --wait"
else if command --search code > /dev/null
  set -g -x EDITOR "code --wait"
else
  set -g -x EDITOR nano
end

if command --search starship > /dev/null
  starship init fish | source
end

if string match -q "$TERM_PROGRAM" "vscode"
  if command --search code-insiders > /dev/null
    set -x CODE_ACTIVATION (code-insiders --locate-shell-integration-path fish)
  else if command --search code > /dev/null
    set -x CODE_ACTIVATION (code --locate-shell-integration-path fish)
  end

  if set -q CODE_ACTIVATION
    source $CODE_ACTIVATION
  else
    echo "Unable to find VS Code shell integration."
  end
end
