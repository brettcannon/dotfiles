if not command --search starship > /dev/null
    function fish_prompt
        set -g __fish_git_prompt_show_informative_status 'yes'
        set -g __fish_git_prompt_showcolorhints 'yes'
        set -g __fish_git_prompt_color_branch yellow
        set -g __fish_git_prompt_color_cleanstate green

        if fish_git_prompt
            echo
        end

        set -l last_status $status
        set -l stat
        if test $last_status -ne 0
            set_color -o red
        else
           set_color -o green
        end
        echo -n "➲ "
        set_color normal
    end
end
