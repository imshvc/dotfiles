#!/usr/bin/env bash

# authors:    Nurudin Imsirovic <imshvc>
# file:       bootstrap-local.sh
# desc:       bootstrap my dotfiles locally
# created:    2025-01-24 05:26 AM
# updated:    2025-01-24 10:13 AM
# repository: https://github.com/imshvc/dotfiles

# one-liner: ./scripts/bootstrap-local.sh 2>/dev/null

# root user: 2 methods
# -- method 1: source files from other user
#      run the command as a regular user:
#        sudo sed "s|\$HOME|/home/$USER|g" ~/.bashrc | sudo tee -a /root/.bashrc >&/dev/null
#
#      sourcing files from other user's home folder is not recommended
#      for security reasons, but I structured my files so that they play
#      nicely alongside two users (the regular user, and root user).
#
#      but then again - you should be bootstrapping into the root folder
#      separately, see method 2:
#
# -- method 2: bootstrap root user
#      run the one-liner like so:
#        ALLOW_ROOT=1 ./scripts/bootstrap-local.sh 2>/dev/null
#
#      this will bootstrap even if the user is root.
#      files will have to be managed separately for each user,
#      but this method is considered more secure as two
#      configurations don't overlap.

# make sure we're within git repo
if [ ! -r "$PWD/scripts/" ]; then
  echo "fail:"
  echo "  this script must run from the git repo"
  echo "  type: cd .., then run:"
  echo "    ./scripts/bootstrap-local.sh"
  exit 1
fi

# bootstrap: not allowed for root user
# unless: ALLOW_ROOT is set
if [ "$ALLOW_ROOT" == "" ]; then
  if [ "$USER" == "root" ]; then
    echo "fail: root user not allowed."
    exit 1
  fi

  if [ "$HOME" == "/root" ]; then
    echo"fail: root user not allowed."
    exit 1
  fi
fi

# dotfiles repo directory
pushd "$PWD" >&/dev/null

echo "info: bootstrap in progress"

# warn: files will be overwritten without prompt
mkdir "$HOME/.local" >&/dev/null
mkdir "$HOME/.local/bin" >&/dev/null

cp ".bash_aliases" "$HOME/.bash_aliases" >&/dev/null
cp ".bash_config" "$HOME/.bash_config" >&/dev/null
cp ".bash_exports" "$HOME/.bash_exports" >&/dev/null
cp ".bash_functions" "$HOME/.bash_functions" >&/dev/null
# cp ".bash_history" "$HOME/.bash_history" >&/dev/null
cp ".bash_logout" "$HOME/.bash_logout" >&/dev/null
cp ".bashrc" "$HOME/.bashrc" >&/dev/null
cp ".gitconfig" "$HOME/.gitconfig" >&/dev/null
cp ".nanorc" "$HOME/.nanorc" >&/dev/null
cp ".profile" "$HOME/.profile" >&/dev/null
cp ".wgetrc" "$HOME/.wgetrc" >&/dev/null
cp ".pathlst" "$HOME/.pathlst" >&/dev/null

source .bashrc

echo "pass: dotfiles bootstrapped"
echo "note: re-open your terminal"

popd >&/dev/null
exit 0
