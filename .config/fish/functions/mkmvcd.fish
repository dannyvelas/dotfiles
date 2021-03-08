function mkmvcd
    if not test -d $argv[-1]
        mkdir -p $argv[-1]
    end
    mv $argv[1..-2] $argv[-1]
    cd $argv[-1]
end
