# Required by rbenv
if which rbenv >/dev/null; then
    eval "$(rbenv init - --no-rehash)"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi

# https://github.com/fohte/rubocop-daemon#use-with-bundler
export RUBOCOP_DAEMON_USE_BUNDLER=true
export PATH="$HOME/bin/rubocop-daemon-wrapper:$PATH"
