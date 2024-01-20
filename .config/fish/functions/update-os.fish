function update-os --description "Update the OS"
    echo "Linux distro ..."
    if test -e /etc/os-release
        if grep --quiet leap /etc/os-release
            echo "No support for OpenSUSE LEAP"
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
            echo "Unsupported Linux distro"
            return 1
        end
    else
        echo "/etc/os-release not found"
        return 1
    end

    echo "Homebrew ..."
    brew update
    brew upgrade
end
