# authors:
#   Nurudin Imsirovic <imshvc>
#
# file:
#   .bash_aliases
#
# description:
#   aliases to boost productivity
#
# created:
#   2025-01-19 01:15 AM
#
# updated:
#   2025-01-23 10:40 PM
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
# todo:
#   bash function to allow arguments
#   because built-in 'cd' does not.
#
#     Example:
#       .. magic  ->  calls 'cd .. && cd magic'
#       r var     ->  calls 'cd / && cd var'
alias ..='cd ..'
alias ~='cd ~'

# todo:
#   switch bash to another shell
#   so we can have unsupported aliases.
# alias \/='cd /'

# begin: aliases for common tools
#
# alias: mkdir (-p, --parents); see 'man mkdir'
alias ?='man $*'
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
# end: aliases for common tools
