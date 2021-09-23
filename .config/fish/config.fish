# For any settings that are machine-specific, use universal variables.
# `set`: http://fishshell.com/docs/current/cmds/set.html?highlight=set
# `fish_add_path`: http://fishshell.com/docs/current/cmds/fish_add_path.html

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

if command --query starship
  starship init fish | source
end

if command --query zoxide
  zoxide init fish | source
end

function tool_mapping -d "Print what an old command should be replaced with"
  set_color red
  echo -n $argv[1]
  set_color normal
  echo -n " → "
  if command --query $argv[2]
    set_color green
    echo $argv[2]
  else
    set_color yellow
    echo -n $argv[2]
    set_color normal
    echo "?"
  end
  set_color normal
end

function fish_greeting
  tool_mapping cd zoxide
  tool_mapping ls exa
  tool_mapping cat bat
  tool_mapping top btm
  tool_mapping du dust
end
