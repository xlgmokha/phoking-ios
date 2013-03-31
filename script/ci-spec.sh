#!/bin/bash -x
echo 'loading bashrc'
source ~/.bashrc

echo 'loading gemset'
rvm use ruby-2.0.0-p0@phoking-ios --create

echo 'bundle install'
bundle install --without production
