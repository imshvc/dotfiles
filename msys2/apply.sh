#!/usr/bin/env bash

# authors:
#   Nurudin Imsirovic <imshvc>
#
# file:
#   msys2/apply.sh
#
# summary:
#   Copy dotfiles to $output_path
#
# created:
#   2025-02-10 06:29 AM
#
# updated:
#   2025-02-10 06:29 AM

# detect: cygwin
# fail: not a supported platform
if [[ "$(uname -s)" =~ ^CYGWIN_NT.* ]]; then
  echo "fail: cygwin is not a supported platform"
  exit 1
fi

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
    exit 2
  else
    # pass: resolved path
    # echo "pass: resolved path: $resolved_path"
    output_path=$resolved_path
  fi
fi

cp ".npmrc" "$output_path" >&/dev/null
cp ".pathlst" "$output_path" >&/dev/null

exit 0
