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
  /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end

if command --search code-insiders > /dev/null
  set -g -x EDITOR "code-insiders --wait"
else if command --search code > /dev/null
  set -g -x EDITOR "code --wait"
else
  set -g -x EDITOR vim
end

if command --search starship > /dev/null
  starship init fish | source
end

if command --search zoxide > /dev/null
  zoxide init fish | source
end
