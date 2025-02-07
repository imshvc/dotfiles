# file: .bash_functions
# created: 2025-01-19 02:14 AM
# updated: 2025-02-07 06:10 PM

# functions:
#   1. log (custom log function with colors)
#   2. mcd (creates a directory and navigates into it)
#   3. cdseq (navigates sequentially from a list of directory names)

# function:
#   custom log function with colors
#
# todo:
#   things that can be replaced with external scripts
#   should be replaced -- shell scripting sucks for
#   this type of work.
log () {
  # fail: expects 2 arguments
  if [ $# -le 1 ]; then
    echo "usage: log <type> <message>"
    echo "  custom log function with colors"
    echo "  types: fail, warn, note, info, pass"
    return 1
  fi

  # init
  local type="$1"
  local text="$2"

  # colors for type:
  #   ** all are bold **
  #   fail - dark red
  #   warn - bright magenta
  #   note - dark blue
  #   info - dark yellow
  #   pass - bright green
  #
  # note: avoid the ugly switch case through simple if
  local color=""

  # color: fail
  if [ "$type" == "fail" ]; then
    color="\e[1m\e[41m\e[97m"
  fi

  # color: warn
  if [ "$type" == "warn" ]; then
    color="\e[1m\e[105m\e[97m"
  fi

  # color: note
  if [ "$type" == "note" ]; then
    color="\e[1m\e[44m\e[97m"
  fi

  # color: info
  if [ "$type" == "info" ]; then
    color="\e[1m\e[43m\e[97m"
  fi

  # color: pass
  if [ "$type" == "pass" ]; then
    color="\e[1m\e[102m\e[30m"
  fi

  # fail: unknown type (color not set because none if statements matched)
  if [ "$color" == "" ]; then
    log fail 'log: supported types are: lowercase (fail, warn, note, info, pass)'
    return 1
  fi

  echo -e "\n  $color $type \e[0m"
  echo -e "\n  $text\n"
}

# function:
#   creates a directory and navigates into it
#
# on error:
#   revert to the initial path
mcd () {
  local path_to_make=$1

  # fail: print usage on no arguments
  if [ "$path_to_make" == "" ]; then
    echo "usage: mcd <relative or absolute file path>"
    echo "  creates a directory and navigates into it"
    return 1
  fi

  # try: create directory
  mkdir -p $1 >&/dev/null

  # fail: mkdir
  if [ $? -ne 0 ]; then
    log fail "\e[1mmcd: mkdir failed:\e[0m $path_to_make"
    return 1
  fi

  # try: navigate into directory
  cd "$path_to_make" >&/dev/null

  # fail: cd
  if [ $? -ne 0 ]; then
    log fail "\e[1mmcd: cd failed:\e[0m $path_to_make"
    return 1
  fi

  # pass: done all the above
  return 0
}

# function:
#   navigates sequentially from a list of directory names
#
# on error:
#   revert to the initial path
cdseq () {
  # fallback: initial path
  local initial_path="$PWD"

  # fail: zero arguments - print help
  if [ $# -eq 0 ]; then
    echo "usage: cdseq <directory name per argument, sequentially>"
    echo "  navigates sequentially from a list of directory names"
  fi

  # main loop
  while [ $# -gt 0 ]; do
    # try: navigate into directory
    cd "$1" >&/dev/null

    # fail: cd
    if [ $? -ne 0 ]; then
      log fail "\e[1mcdseq: cd failed:\e[0m $PWD/$1"
      # fallback to initial path
      cd "$initial_path"
      return 1
    fi

    # see: shift --help
    shift
  done

  # pass: done all the above
  return 0
}
