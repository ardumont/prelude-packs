#!/bin/bash -x

WDIR=$(dirname $0)

# Pre-requisite - install cask and init the Cask file

bash $WDIR/install-cask.sh

# Deploy prelude-packs

FILE="$HOME/.emacs.d/personal/prelude-packs-delegate.el"
[ ! -f $FILE ] && \
    echo "(let ((prelude-packs-file (expand-file-name \"~/.prelude-packs/prelude-packs.el\"))) (when (file-exists-p prelude-packs-file) (load-file prelude-packs-file)))" > $FILE

[ ! -f ~/.prelude-packs ] && ln -nsf $WDIR ~/.prelude-packs
