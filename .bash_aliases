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
#   2025-01-24 10:27 AM
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
#
# alias: mkdir (-p, --parents); see 'man mkdir'
alias ?='man $*'
alias ls='ls --color=always'
alias ll='ls -laF --color=always'
alias la='ls -A --color=always'
alias l='ls -CF --color=always'
alias l1='ls -la1 --color=always'
alias dir='dir --color=always'
alias vdir='vdir --color=always'
alias mkdir='mkdir -p'
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
# end: aliases for everything and anything

# add an "alert" alias for long running commands
# use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
