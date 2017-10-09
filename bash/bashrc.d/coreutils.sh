if [ "$(uname -s)" == 'Darwin' ]; then
    if [ -n "$(brew ls --versions coreutils)" ]; then
      export MANPATH="`brew --prefix`/opt/coreutils/libexec/gnuman:$MANPATH"
      export PATH="`brew --prefix`/opt/coreutils/libexec/gnubin:$PATH"

    fi

    if [ -n "$(brew ls --versions gnu-sed)" ]; then
      export MANPATH="`brew --prefix`/opt/gnu-sed/libexec/gnuman:$MANPATH"
      export PATH="`brew --prefix`/opt/gnu-sed/libexec/gnubin:$PATH"
    fi
fi
