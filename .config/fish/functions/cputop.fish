function cputop --description "`top`, but sorted by CPU usage"
    top -ocpu -R -F -s 2 $argv
end
