set noclobber # #don't overwrite exisiting files when redirecting output
set notify # #notify immediately when background jobs are completed

# set prompt
PS1='\[$(tput setaf 2)\]\[$(tput bold)\]\t\[$(tput sgr0)\]\[$(tput sgr0)\] [\u@\h \W]$ '

function title {
    if [ "$1" ]
    then
        unset PROMPT_COMMAND
        echo -ne "\033]0;${*}\007"
    else
        export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'
    fi
}
title

function mkdircd () {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

function sshuh () {
    sed -i "$1d" ~/.ssh/known_hosts
}

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# We suggest you keep all of your aliases in a seperate file called .aliases
# If .aliases exists it will envoked by the next line:
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

export HISTTIMEFORMAT="%F %T "
export PATH=$PATH:~/.local/bin


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
