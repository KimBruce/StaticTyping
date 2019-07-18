#!/usr/bin/env sh
cd ..
mkdir gracelang
cd gracelang
git clone https://github.com/pavlerohalj/minigrace.git
cd minigrace
git checkout xmodule
make install
