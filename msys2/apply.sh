#!/usr/bin/env bash

# authors:
#   Nurudin Imsirovic <imshvc>
#
# file:
#   msys2/apply.sh
#
# summary:
#   Copy dotfiles to $home_path
#
# created:
#   2025-02-10 06:29 AM
#
# updated:
#   2025-02-11 05:31 PM

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

cp ".npmrc" "$home_path" >&/dev/null
cp ".pathlst" "$home_path" >&/dev/null

cat ".bash_exports.append" >> "$home_path/.bash_exports"

cp "scripts/chrome" "$home_path/.local/scripts" >&/dev/null
cp "scripts/code" "$home_path/.local/scripts" >&/dev/null
cp "scripts/dotnet" "$home_path/.local/scripts" >&/dev/null
cp "scripts/firefox" "$home_path/.local/scripts" >&/dev/null
cp "scripts/msedge" "$home_path/.local/scripts" >&/dev/null
cp "scripts/php" "$home_path/.local/scripts" >&/dev/null

exit 0
