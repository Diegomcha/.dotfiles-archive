if status is-interactive
    # Commands to run in interactive sessions can go here
    # run-parts /etc/update-motd.d

    # Replaces trash command to include clear subcommand
    function trash
        switch $1
            case --empty
                trash-empty
            case '*'
                command trash $1
        end
    end

    # Replace rm with a safer command
    if type -q -f trash
        alias rm 'trash'
    end

    # Replace ls
    if type -q -f exa
        alias ls 'exa -G  --color auto --icons -s type'
        alias ll 'exa -l --color always --icons -a -s type'
    end

    # Replace cat
    if type -q -f batcat
        alias cat 'batcat --theme="OneHalfDark"'
    end
end

