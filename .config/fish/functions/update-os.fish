function update-os --description "Update the OS"
    echo "Linux distro ..."
    if test -e /etc/os-release
        if grep --quiet leap /etc/os-release
            echo "⚠️ No support for OpenSUSE LEAP"
            return 1
        else if grep --quiet tumbleweed /etc/os-release
            # Python dependencies: zypper info -t pattern devel_basis
            sudo zypper --non-interactive dist-upgrade
        # Debian covers Ubuntu as well thanks to `ID_LIKE=debian`.
        else if grep --quiet debian /etc/os-release
            # https://devguide.python.org/getting-started/setup-building/#install-dependencies
            # https://wiki.debian.org/InstallingDebianOn/Microsoft/Windows/SubsystemForLinux
            sudo apt update && sudo apt full-upgrade --yes
	else if grep --quiet Fedora /etc/os-release
            # dnf builddep python3
	    sudo dnf upgrade -y --refresh
        else
            echo "⚠️ Unsupported Linux distro"
            return 1
        end
    else
        echo "⚠️ /etc/os-release not found"
        return 1
    end

    echo
    echo "Homebrew ..."
    brew update
    brew upgrade -y

    echo
    echo "uv ..."
    uv self update
    uv tool upgrade --all

    echo
    echo "Fish completions ..."
    __update_os_completion uv uv generate-shell-completion fish; or return
    __update_os_completion uvx uvx --generate-shell-completion fish; or return
    __update_os_completion fnm fnm completions --shell fish; or return
    __update_os_completion pipx register-python-argcomplete --shell fish pipx; or return
    __update_os_completion copilot copilot completion fish
end

function __update_os_completion --argument-names tool
    set -e argv[1]
    if not command --search $tool > /dev/null
        echo "⏭️ $tool"
        return 0
    end

    set -l completions_dir "$__fish_config_dir/completions"
    mkdir -p "$completions_dir"; or return
    set -l completion_file (mktemp "$completions_dir/$tool.fish.XXXXXX"); or return

    $argv > "$completion_file"
    if test $status -ne 0
        rm "$completion_file"
        echo "⚠️ Unable to generate $tool completions" >&2
        return 1
    end

    mv "$completion_file" "$completions_dir/$tool.fish"; or return
    echo "🗹 $tool"

end
