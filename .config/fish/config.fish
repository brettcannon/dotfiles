# For any settings that are machine-specific, use universal variables.
set -g -x EDITOR vim
set -g -x CLICOLOR 1
set -g -x CC clang
set -g -x CXX clang++
set -g -x CFLAGS "-Wno-unused-value -Wno-empty-body -Qunused-arguments -Wno-deprecated-declarations"
set -x GPG_TTY (tty)

starship init fish | source
