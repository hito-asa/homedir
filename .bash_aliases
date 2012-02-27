# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lF'
alias lla='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias h="history 40"

alias assh="ssh -i ~/.ssh/aws/hito_asa_aws_tokyo.pem"
alias ascp='scp -i ~/.ssh/aws/hito_asa_aws_tokyo.pem'
alias xrfit='xrandr --size 1400x1050'

alias py=ipython

alias ualt='update-alternatives --altdir ~/.alternatives --admindir ~/.alternatives/admin'

alias findscala='(find . -name "*.java";find . -name "*.scala") | sort | xargs grep --color'
alias findphp='(find . -name "*.phtml";find . -name "*.php") | sort | xargs grep --color'
alias findruby='(find . -name "*.rb";find . -name "*.erb") | sort | xargs grep --color'

alias svndiff='svn diff | less'
alias pin=ping
alias codersync='rsync -CLrv --delete ~/work/codesnap/src tweb:/data/App/Boys'

