set noclobber # #don't overwrite exisiting files when redirecting output
set notify # #notify immediately when background jobs are completed

# set prompt
PS1='\[$(tput setaf 2)\]\[$(tput bold)\]\t\[$(tput sgr0)\]\[$(tput sgr0)\] [\u@\h \W]$ '

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# We suggest you keep all of your aliases in a seperate file called .aliases
# If .aliases exists it will envoked by the next line:
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

export HISTTIMEFORMAT="%F %T "
