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
#   2025-02-26 11:13 AM

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
mkdir -p "$home_path/.local/share" >&/dev/null
mkdir -p "$home_path/.local/share/nano-syntax-highlighting" >&/dev/null

# todo: for loop to solve this without hardcoded names
scripts="edit-script hosts is-cygwin is-msys2 todo ytmp3 ytmp4"

for script in $(echo $scripts | tr " " "\n"); do
  cp ".local/scripts/${script}" "$home_path/.local/scripts" >&/dev/null
  chmod +x "$home_path/.local/scripts/${script}" >&/dev/null
done

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

# install nano syntax highlighting
if [ -f "nano-syntax-highlighting.zip" ]; then
  unzip "nano-syntax-highlighting.zip" -d "$home_path/.local/share/nano-syntax-highlighting" 2>&1 >/dev/null
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
