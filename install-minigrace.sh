#!/usr/bin/env sh
cd ..
mkdir gracelang
cd gracelang
git clone https://github.com/KimBruce/minigrace.git
cd minigrace
git checkout xmodule
make install
