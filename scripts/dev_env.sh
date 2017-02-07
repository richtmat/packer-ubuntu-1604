#!/bin/zsh -eux

# install tmuxinator
#gem install tmuxinator

# start elasticsearch ffs
# sudo systemctl start elasticsearch

# cd /home/vagrant/development/finderbox/finderbox
# bundle install
# echo rake db:insert-test-data

#tmuxinator start finderbox
#tmux attach

mkdir "${HOME}/.npm-packages"

echo prefix=${HOME}/.npm-packages > ${HOME}/.npmrc

