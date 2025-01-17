# For any settings that are machine-specific, use universal variables.
# `set`: http://fishshell.com/docs/current/cmds/set.html?highlight=set
# `fish_add_path`: http://fishshell.com/docs/current/cmds/fish_add_path.html

set -g -x CC clang
set -g -x CXX clang++
# https://devguide.python.org/getting-started/setup-building/#clang
set -g -x CFLAGS "-Wno-unused-value -Wno-empty-body -Qunused-arguments -Wno-parentheses-equality"
set -x GPG_TTY (tty)
set -g -x PIP_REQUIRE_VIRTUALENV 1
set -g -x PIP_RESPECT_VIRTUALENV 1
# Move to os.process_cpu_count() once Python 3.13 is the oldest.
set -g -x MAKEFLAGS (python3 -c "import os; print(f'-j{os.cpu_count()}')")

# Must come before anything relying on `PATH`.
if test -e /home/linuxbrew/.linuxbrew/bin/brew
  set -g -x HOMEBREW_NO_ENV_HINTS 1
  /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
end


if status is-interactive
  set -g -x CLICOLOR 1

  if command --search starship > /dev/null
    starship init fish | source
  end

  if test -e ~/.1password/agent.sock
    set -g -x SSH_AUTH_SOCK ~/.1password/agent.sock
  else if test -e ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
    set -g -x SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
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
    set -g -x EDITOR vim
  end

  if command --search autojump > /dev/null
    if test -f /home/linuxbrew/.linuxbrew/share/autojump/autojump.fish
        echo "🗹 autojump "
        source /home/linuxbrew/.linuxbrew/share/autojump/autojump.fish
    else
        echo "Activation script for autojump not found!"
    end
  else
    echo "❌ autojump"
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
end

if command --search uv > /dev/null
  uv generate-shell-completion fish | source
end
if command --search uvx > /dev/null
  uvx --generate-shell-completion fish | source
end
