set -o vi
shopt -s nocaseglob

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=50000
HISTFILESIZE=40000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## PS1
MY_NAMES="lhasai usr0200241 hitoshi"
LOCALHOST_NAMES="JMEN0090 ubuntu"
if [[ "$MY_NAMES" == *${USER}* ]]; then
  DISP_NAME=''
else
  DISP_NAME='\[\033[01;32m\]\u\[\033[00m\]'
fi
if [[ "$LOCALHOST_NAMES" == *${HOSTNAME}* ]]; then
  DISP_HOST=''
else
  DISP_HOST='\[\033[01;36m\]\h\[\033[00m\]'
  if [[ -n "${DISP_NAME}" ]]; then
    DISP_NAME='${DISP_NAME}\[\033[01;30m\]@\[\033[00m\]'
  fi
fi
if [[ -n "${DISP_NAME}${DISP_HOST}" ]]; then
  SEP='\[\033[01;30m\]:\[\033[00m\]'
else
  SEP=''
fi
PS1="${DISP_NAME}${DISP_HOST}${SEP}\[\033[37m\]\W\[\033[00m\]\[\033[01;30m\]$\[\033[00m\] "

export PATH=$HOME/bin:$PATH

# Alias definitions.
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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# ruby
if [ -f $HOME/.rvm/scripts/rvm ]; then
    . $HOME/.rvm/scripts/rvm
fi

# perl
if [ -s "$HOME/perl5/perlbrew/etc/bashrc" ]; then
  . $HOME/perl5/perlbrew/etc/bashrc
fi

# gauche
export RLWRAP_EDITOR='vim -c "set filetype=scheme"'

