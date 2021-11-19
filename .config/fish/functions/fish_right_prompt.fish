if not command --search starship > /dev/null
    function fish_right_prompt
        set_color -o green
        prompt_pwd
        set_color normal
    end
end
