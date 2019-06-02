# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=40000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

set -o vi
shopt -s nocaseglob

## PS1
MY_NAMES="lhasai usr0200241 hitoshi"
if [[ "$MY_NAMES" == *${USER}* ]]; then
  DISP_NAME=''
else
  DISP_NAME='\[\033[01;32m\]\u\[\033[00m\]'
fi
DISP_HOST=''
if [[ -n "${DISP_NAME}${DISP_HOST}" ]]; then
  SEP='\[\033[01;30m\]:\[\033[00m\]'
else
  SEP=''
fi
PS1="${DISP_NAME}${DISP_HOST}${SEP}\[\033[37m\]\W\[\033[00m\]\[\033[01;30m\]$\[\033[00m\] "

export PATH=$HOME/bin:$PATH

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment definitions
if [ -f ~/.bash_env ]; then
  . ~/.bash_env
fi

# UNMANAGED Environment definitions
if [ -f ~/.bash_env_unmanaged ]; then
  . ~/.bash_env_unmanaged
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
if [[ $TERMINIX_ID ]]; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END

#[ -r /home/hitoshi/.byobu/prompt ] && . /home/hitoshi/.byobu/prompt   #byobu-prompt#

# ruby
if [ -f $HOME/.rvm/scripts/rvm ]; then
    . $HOME/.rvm/scripts/rvm
fi

# gauche
export RLWRAP_EDITOR='vim -c "set filetype=scheme"'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gvm
[[ -s "${HOME}/.gvm/scripts/gvm" ]] && source "${HOME}/.gvm/scripts/gvm"

ssh() {
  cat $HOME/.ssh/configs/* > $HOME/.ssh/config
  ssh_cmd="/usr/bin/ssh -F $HOME/.ssh/config $@"
  if [ -z "$TMUX" ]; then
    printf "\\033k${!#}\\033\\\\"
    $ssh_cmd
    printf "\\033k${HOSTNAME}\\033\\\\"
  else
    tmux new-window -n ${!#} "$ssh_cmd"
  fi
}


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
          source /etc/profile.d/vte.sh
          fi


source /etc/profile.d/rvm.sh

