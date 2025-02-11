#!/usr/bin/env bash

# authors:
#   Nurudin Imsirovic <imshvc>
#
# file:
#   apply.sh
#
# summary:
#   Copy dotfiles to $home_path
#
# created:
#   2025-02-07 11:44 AM
#
# updated:
#   2025-02-11 09:53 AM

# fail: cygwin is not supported
if [[ "$(uname -s)" =~ ^CYGWIN_NT.* ]]; then
  echo "fail: cygwin is not supported"
  exit 1
fi

# no location given
# defaults to $HOME
home_path=$HOME

# do: check argument values
if [ $# != 0 ]; then
  new_path=$1

  # do: check is path valid
  resolved_path=$(realpath -e "$new_path" 2>/dev/null)

  if [ $? != 0 ]; then
    # fail: invalid output path
    echo "fail: invalid output path: $new_path"
    exit 2
  else
    # pass: resolved path
    # echo "pass: resolved path: $resolved_path"
    home_path=$resolved_path
  fi
fi

# set: state
is_msys2=0

# detect: msys2
if [[ "$(uname -s)" =~ ^MSYS_NT.* ]]; then
  is_msys2=1

  # fix: msys2: user not set
  if [ "$USER" = "" ]; then
    USER=$USERNAME
  fi
fi

mkdir -p "$home_path/.local" >&/dev/null
mkdir -p "$home_path/.local/bin" >&/dev/null
mkdir -p "$home_path/.local/scripts" >&/dev/null

cp ".local/scripts/is-cygwin" "$home_path/.local/scripts" >&/dev/null
cp ".local/scripts/is-msys2" "$home_path/.local/scripts" >&/dev/null
cp ".local/scripts/ytmp3" "$home_path/.local/scripts" >&/dev/null
cp ".local/scripts/ytmp4" "$home_path/.local/scripts" >&/dev/null

chmod +x "$home_path/.local/scripts/is-cygwin" >&/dev/null
chmod +x "$home_path/.local/scripts/is-msys2" >&/dev/null
chmod +x "$home_path/.local/scripts/ytmp3" >&/dev/null
chmod +x "$home_path/.local/scripts/ytmp4" >&/dev/null

cp ".bash_aliases" "$home_path" >&/dev/null
cp ".bash_config" "$home_path" >&/dev/null
cp ".bash_exports" "$home_path" >&/dev/null
cp ".bash_functions" "$home_path" >&/dev/null
cp ".bash_login" "$home_path" >&/dev/null
cp ".bash_logout" "$home_path" >&/dev/null
cp ".bash_profile" "$home_path" >&/dev/null
cp ".bashrc" "$home_path" >&/dev/null
cp ".gitconfig" "$home_path" >&/dev/null
cp ".hushlogin" "$home_path" >&/dev/null
cp ".nanorc" "$home_path" >&/dev/null
cp ".npmrc" "$home_path" >&/dev/null
cp ".pathlst" "$home_path" >&/dev/null
cp ".profile" "$home_path" >&/dev/null
cp ".wgetrc" "$home_path" >&/dev/null

# create .bash_history
if [ ! -f "$home_path/.bash_history" ]; then
  touch "$home_path/.bash_history"
fi

# on msys2 this script runs and has to
# be last as it overwrites prior files
if [ $is_msys2 = 1 ]; then
  if [ -f "msys2/apply.sh" ]; then
    # pass: found
    pushd "msys2" 2>&1 >/dev/null

    chmod +x "apply.sh"
    ./apply.sh "$home_path"

    popd 2>&1 >/dev/null
  else
    # fail: not found
    echo "fail: msys2/apply.sh not found"
  fi
fi

# pass: successful bootstrap
echo "imshvc/dotfiles... done"
exit 0
