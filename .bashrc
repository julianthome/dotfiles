# .bashrc for OS X, ArchLinux and Ubuntu

# --------------------------------------------------------------------
# System Settings
# --------------------------------------------------------------------

export PLATFORM=$(uname -s)
BASE=$(dirname $(readlink $BASH_SOURCE))

# --------------------------------------------------------------------
# Variables
# --------------------------------------------------------------------

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
[ -z "$TMPDIR" ] && TMPDIR=/tmp

export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
[ "$PLATFORM" = 'Darwin' ] ||
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.:/usr/local/lib

### OS X no ._* in tars anymore
export COPYFILE_DISABLE=true


# --------------------------------------------------------------------
# Variables
# --------------------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias l='ls -alF'
alias ll='ls -l'
alias vi='vim'
alias tmux="tmux -2"

