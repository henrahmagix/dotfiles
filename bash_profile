#!/usr/bin/env bash

# Use latest bash
if [ ! -f /usr/local/bin/bash ]; then
  echo "Not using latest bash: brew install bash"
fi

SHOW_TIMING=0

# ~/.extra can be used for settings you don’t want to commit
for file in path vars prompt aliases functions home-todo osx python node ruby go gcloudrc extra completion; do
  file="$HOME/.$file"
  if [ $SHOW_TIMING -eq 1 ]; then
      [ -e "$file" ] && echo -n "source $file" && time source "$file"
  else
      [ -e "$file" ] && source "$file"
  fi
done

unset SHOW_TIMING
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
shopt -s extglob

# Double-asterisk wildcard globbing
shopt globstar 2>&1 | grep -qv 'invalid shell option' && shopt -s globstar

# Allow expansion of $! variables with space
bind Space:magic-space
