function mvcd
    mv $argv[1..-2] $argv[-1]
    cd $argv[-1]
end
