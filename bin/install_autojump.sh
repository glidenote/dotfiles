#!/bin/sh

set -eu
export LANG=C
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

autojump
git clone https://github.com/joelthelion/autojump ~/src/autojump
cd ~/src/autojump/
./install.py

