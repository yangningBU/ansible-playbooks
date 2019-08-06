#!/bin/bash
DEFAULT_VERSION="ruby-2.6.3"
version=`cat .ruby-version || echo $DEFAULT_VERSION`
brew update
brew install ruby-install # 0.7.0
ruby-install ruby $version # 17:42:09 -> 18:10:17 (takes about half an hour)
brew install chruby # 0.3.9

bashrc=~/.bashrc
source_chruby_line="source /usr/local/opt/chruby/share/chruby/chruby.sh"
source_chruby_auto="source /usr/local/share/chruby/auto.sh"
grep -q "$source_chruby_line" $bashrc || printf "\n$source_chruby_line\n" >> $bashrc
grep -q "$source_chruby_auto" $bashrc || printf "$source_chruby_auto\n" >> $bashrc
source ~/.bashrc
