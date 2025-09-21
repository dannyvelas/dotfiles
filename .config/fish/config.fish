# aliases
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias rm="rm -i"

# abbrevs
abbr --add g git
abbr --add gl git log
abbr --add ga git add
abbr --add gd git diff
abbr --add gs git status
abbr --add gco git checkout
abbr --add gcm git commit -m


# !$ and !! convenience
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

# zoxide
eval "$(zoxide init fish)"

# opam
#source /Users/dannyvelasquez/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# rust
#source /Users/dannyvelasquez/.cargo/env.fish
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
