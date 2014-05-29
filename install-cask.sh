#!/bin/bash -e

# install cask
[ ! -d ~/.cask ] && curl -fsSkL https://raw.github.com/cask/cask/master/go | python
