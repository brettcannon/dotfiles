if command -v starship > /dev/null
then
    eval "$(starship init zsh)"
else
    PROMPT='%F{red}>%f '
    RPROMPT='%F{cyan}%~%f'
fi
