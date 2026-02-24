function s --description "Substitute and run: s old new"
    if test (count $argv) -lt 2
        echo "Usage: s old new"
        return 1
    end

    # Determine the base command to substitute on
    set -l base_command
    if string match -qr '^s ' "$history[1]"; and set -q __s_last_command
        # Previous command was 's', use the stored command
        set base_command $__s_last_command
    else
        # Find the first history entry that isn't an 's' command to avoid infinite recursion
        for cmd in $history
            if not string match -qr '^s ' $cmd
                set base_command $cmd
                break
            end
        end
    end

    if test -z "$base_command"
        echo "No non-s command found in history"
        return 1
    end

    set -g __s_last_command (string replace $argv[1] $argv[2] $base_command)
    echo "❯" $__s_last_command
    eval $__s_last_command
end
