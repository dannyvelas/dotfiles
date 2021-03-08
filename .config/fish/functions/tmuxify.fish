function tmuxify
    if test $argv[1]; and test -d $argv[2]
        if not tmux has-session -t $argv[1] 2>/dev/null
            cd $argv[2]
            tmux new -s $argv[1] -d
            tmux split-window   -t $argv[1]:0
            tmux resize-pane -D -t $argv[1]:0 10
        end
        tmux a -t $argv[1]
    else
        echo "Use: tmuxify <session_name> <dir>"
    end
end
