#!/bin/bash -xe

WDIR=$(dirname $0)

FILE="$HOME/.emacs.d/personal/prelude-packs-delegate.el"
[ ! -f $FILE ] && echo "(let ((prelude-packs-file (expand-file-name \"~/.prelude-packs/prelude-packs.el\"))) (when (file-exists-p prelude-packs-file) (load-file prelude-packs-file)))" > $FILE

ln -nsf $WDIR/../prelude-packs ~/.prelude-packs
