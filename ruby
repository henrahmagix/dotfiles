# Required by rbenv
if which rbenv >/dev/null; then
    eval "$(rbenv init - --no-rehash)"
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi

# https://github.com/fohte/rubocop-daemon#use-with-bundler
export RUBOCOP_DAEMON_USE_BUNDLER=true
# Don't add to PATH because we're symlinking the rbenv shim instead, so it uses bundler per gemset.
# export PATH="$HOME/bin/rubocop-daemon-wrapper:$PATH"

# This fixes spring for some reason: see https://github.com/ged/ruby-pg/issues/311#issuecomment-1609970533
export PGGSSENCMODE="disable"
