function update-os --description "Update the OS"
    echo "Linux distro ..."
    if test -e /etc/os-release
        if grep --quiet leap /etc/os-release
            echo "No support OpenSUSE LEAP (yet)"
            return 1
        else if grep --quiet tumbleweed /etc/os-release
            # zypper info -t pattern devel_basis
            sudo zypper --non-interactive dist-upgrade
        else if grep --quiet debian /etc/os-release
            # Covers Ubuntu as well thanks to `ID_LIKE=debian`.
            apt update -y
            sudo apt upgrade -y
            sudo apt autoremove -y
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
