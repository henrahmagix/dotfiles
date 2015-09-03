# Load ~/.bash_prompt, ~/.vars, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in path vars completion prompt aliases home-todo osx python extra; do
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

# Required by rbenv
eval "$(rbenv init -)"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
shopt -s extglob

# Allow expansion of $! variables with space
bind Space:magic-space
