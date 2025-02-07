#!/usr/bin/env bash

# authors:
#   Nurudin Imsirovic <imshvc>
#
# file:
#   apply.sh
#
# summary:
#   Copy dotfiles to $output_path
#
# created:
#   2025-02-07 11:44 AM
#
# updated:
#   2025-02-08 12:20 AM

# if you don't specify the location
# via arguments then output path
# defaults to $HOME
output_path=$HOME

# do: check argument values
if [ $# != 0 ]; then
  new_path=$1

  # do: check is path valid
  resolved_path=$(realpath -e "$new_path" 2>/dev/null)

  if [ $? != 0 ]; then
    # fail: invalid output path
    echo "fail: invalid output path: $new_path"
    exit 1
  else
    # pass: resolved path
    echo "pass: resolved path: $resolved_path"
    output_path=$resolved_path
  fi
fi

echo "info: output path: $output_path"
echo "warn: files will be overwritten without prompt"

mkdir -p "$output_path/.local" >&/dev/null
mkdir -p "$output_path/.local/bin" >&/dev/null
mkdir -p "$output_path/.local/scripts" >&/dev/null

cp ".local/scripts/ytmp3" "$output_path/.local/scripts" >&/dev/null
cp ".local/scripts/ytmp4" "$output_path/.local/scripts" >&/dev/null

cp ".bash_aliases" "$output_path" >&/dev/null
cp ".bash_config" "$output_path" >&/dev/null
cp ".bash_exports" "$output_path" >&/dev/null
cp ".bash_functions" "$output_path" >&/dev/null
cp ".bash_login" "$output_path" >&/dev/null
cp ".bash_logout" "$output_path" >&/dev/null
cp ".bash_profile" "$output_path" >&/dev/null
cp ".bashrc" "$output_path" >&/dev/null
cp ".gitconfig" "$output_path" >&/dev/null
cp ".gitignore" "$output_path" >&/dev/null
cp ".nanorc" "$output_path" >&/dev/null
cp ".npmrc" "$output_path" >&/dev/null
cp ".pathlst" "$output_path" >&/dev/null
cp ".profile" "$output_path" >&/dev/null
cp ".wgetrc" "$output_path" >&/dev/null

# create .bash_history
if [ ! -f "$output_path/.bash_history" ]; then
  touch "$output_path/.bash_history"
fi

echo "pass: applied dotfiles"
echo "info: new terminal instance is required to see the changes"

exit 0
