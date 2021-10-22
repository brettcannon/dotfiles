# For any settings that are machine-specific, use universal variables.
# `set`: http://fishshell.com/docs/current/cmds/set.html?highlight=set
# `fish_add_path`: http://fishshell.com/docs/current/cmds/fish_add_path.html

set -g -x CLICOLOR 1
set -g -x CC clang
set -g -x CXX clang++
set -g -x CFLAGS "-Wno-unused-value -Wno-empty-body -Qunused-arguments -Wno-deprecated-declarations"
set -x GPG_TTY (tty)
set -g -x PIP_REQUIRE_VIRTUALENV 1
set -g -x MAKEFLAGS (python3 -c "import multiprocessing; print(f'-j{multiprocessing.cpu_count()}')")

if command --query nvim
  set -g -x EDITOR nvim
else
  set -g -x EDITOR vim
end

if command --query starship
  starship init fish | source
end

if command --query zoxide
  zoxide init fish | source
end
