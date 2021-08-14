function add_homebrew_library
    # (brew --prefix $argv), except inlined because otherwise it's rather slow.
    set -U LDFLAGS "-L/usr/local/opt/$argv/lib $LDFLAGS"
    set -U CPPFLAGS "-I/usr/local/opt/$argv/include $CPPFLAGS"
end
