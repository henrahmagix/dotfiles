SHOW_TIMING=0

# ~/.extra can be used for settings you don’t want to commit
for file in path vars prompt aliases functions home-todo osx python node ruby go gcloudrc extra completion; do
  file="$HOME/.$file"
  if [ $SHOW_TIMING -eq 1 ]; then
      [ -e "$file" ] && time source "$file" && echo "source $file"
  else
      [ -e "$file" ] && source "$file"
  fi
done

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
shopt -s extglob

# Allow expansion of $! variables with space
bind Space:magic-space
