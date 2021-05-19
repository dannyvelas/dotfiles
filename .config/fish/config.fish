alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"


function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
