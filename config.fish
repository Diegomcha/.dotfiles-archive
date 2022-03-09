if status is-interactive
    if status is-login
        neofetch
    end

    # Replaces trash command to include clear subcommand
    function trash
        switch $argv[1]
            case --empty
                trash-empty
            case '*'
                command trash $argv
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

    set -gx GPG_TTY (tty)
end
