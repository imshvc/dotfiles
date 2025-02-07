# authors:
#   Nurudin Imsirovic <imshvc>
#
# file:
#   .bash_aliases
#
# created:
#   2025-01-19 01:15 AM
#
# updated:
#   2025-02-07 05:37 PM
#
# repository:
#   https://github.com/imshvc/dotfiles

# description: common path navigation
#   ..  one level back
#   ~   home directory
#   r   root directory
#
# note: '/' cannot be used as an alias (bash only?)
#
# usage:
#   .. magic  ->  calls 'cd .. && cd magic'
#   r var     ->  calls 'cd / && cd var'
alias ..='cdseq ..'
alias ~='cdseq ~'
alias r='cdseq /'

# todo:
#   switch bash to another shell
#   so we can have unsupported aliases.
# alias \/='cd /'

# begin: aliases for everything and anything
alias ?='man $*'
alias ls='ls -laF --color=always'
alias ll='ls -laF --color=always'
alias la='ls -laF --color=always'
alias l='ls -laF --color=always'
alias l1='ls -laF --color=always'
alias dir='dir --color=always'
alias vdir='vdir --color=always'
alias mkdir='mkdir -p'
alias md='mkdir -p'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias path='echo $PATH'
alias paths='echo $PATH | tr : \\n'
alias md='mkdir -p'
alias q='exit'
alias c='clear'
alias dl='~ Downloads'
alias downloads='~ Downloads'
alias ds='~ Desktop'
alias desk='~ Desktop'
alias desktop='~ Desktop'
alias doc='~ Documents'
alias docs='~ Documents'
alias pathlst='$EDITOR ~/.pathlst'
alias tmp='~ tmp'
alias temp='~ tmp'
alias .ssh='~ .ssh'
#alias work='cdseq  /d/work'
# end: aliases for everything and anything

# use 'colordiff'
alias diff='colordiff'

# add an 'alert' alias for long running commands
# use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
