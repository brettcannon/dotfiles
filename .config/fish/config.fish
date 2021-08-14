# For any settings that are machine-specific, use universal variables.
set -g -x CLICOLOR 1
set -g -x CC clang
set -g -x CXX clang++
set -g -x CFLAGS "-Wno-unused-value -Wno-empty-body -Qunused-arguments -Wno-deprecated-declarations"
set -x GPG_TTY (tty)

if command --query code-insiders
  set -g -x EDITOR code-insiders
else if command --query code
  set -g -x EDITOR code
else if command --query nvim
  set -g -x EDITOR nvim
else
  set -g -x EDITOR vim
end

starship init fish | source
