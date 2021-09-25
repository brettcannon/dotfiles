if command -v starship > /dev/null
then
    eval "$(starship init bash)"
else
    export PS1="\[\e[36m\]\W\[\e[m\]\[\e[31m\] >\[\e[m\] "
fi
