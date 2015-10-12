set noclobber # #don't overwrite exisiting files when redirecting output
set notify # #notify immediately when background jobs are completed

# set prompt
PS1='\[$(tput setaf 2)\]\[$(tput bold)\]\t\[$(tput sgr0)\]\[$(tput sgr0)\] [\u@\h \W]$ '

# We suggest you keep all of your aliases in a seperate file called .aliases
# If .aliases exists it will envoked by the next line:
if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

## Don't know if this does anything. Uncomment to test.
## setup bash color
#COLORS=/etc/DIR_COLORS
#[ -e "/etc/DIR_COLORS.$TERM" ] && COLORS="/etc/DIR_COLORS.$TERM"
#[ -e "$HOME/.dircolors" ] && COLORS="$HOME/.dircolors"
#[ -e "$HOME/.dir_colors" ] && COLORS="$HOME/.dir_colors"
#[ -e "$HOME/.dircolors.$TERM" ] && COLORS="$HOME/.dircolors.$TERM"
#[ -e "$HOME/.dir_colors.$TERM" ] && COLORS="$HOME/.dir_colors.$TERM"
#[ -e "$COLORS" ] || return

export HISTTIMEFORMAT="%F %T "
export PATH=$PATH:~/.local/bin
