# Lazy load rbenv (copy of nvm lazy load)
# https://www.reddit.com/r/node/comments/4tg5jg/lazy_load_nvm_for_faster_shell_start/d5ib9fs

load_rbenv () {
    echo "rbenv..."

    # Required by rbenv
    eval "$(rbenv init -)"
}

declare -a RUBY_GLOBALS=($(basename ~/.rbenv/shims/*))

# Create empty scripts dir and add to PATH
NODE_TMP_DIR=/tmp/ruby_globals
# Allow path string to be used in sed with / delimiter: http://stackoverflow.com/a/27789859/3150057
NODE_TMP_DIR_SED=${NODE_TMP_DIR//\//\\/}
mkdir $NODE_TMP_DIR
export PATH="$PATH:$NODE_TMP_DIR"

clean_up_ruby_globals () {
    # Remove empty scripts
    (cd $NODE_TMP_DIR && rm ${RUBY_GLOBALS[@]})
    # Reset PATH by removing empty scripts dir: http://stackoverflow.com/a/18925756/3150057
    export PATH=$(echo $PATH | sed -e "s/:$NODE_TMP_DIR_SED//")
    # Remove all ruby binary functions made below
    unset -f ${RUBY_GLOBALS[@]}
}

for cmd in "${RUBY_GLOBALS[@]}"; do
    # Make empty script with shebang in case anything needs to load them
    echo "#!/bin/sh" > $NODE_TMP_DIR/$cmd
    chmod +x $NODE_TMP_DIR/$cmd
    eval "${cmd}(){
        clean_up_ruby_globals
        load_rbenv
        ${cmd} \$@
    }"
done
