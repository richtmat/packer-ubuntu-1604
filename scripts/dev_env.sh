#!/bin/zsh -eux

# install tmuxinator
gem install tmuxinator

# start elasticsearch ffs
sudo systemctl start elasticsearch

cd /home/vagrant/development/f/finderbox
bundle install
echo rake db:insert-test-data

tmuxinator start finderbox
tmux attach