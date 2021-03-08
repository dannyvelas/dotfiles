function mkcd
    if not test -d $argv[1]
        mkdir -p $argv[1]
    end
    cd $argv[1]
end
