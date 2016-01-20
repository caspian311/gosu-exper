#!/bin/bash -e

RUBY_BIN_PATH=$(which ruby)

pushd $(dirname $0) &> /dev/null
BASEDIR=$(pwd)
popd &> /dev/null

$RUBY_BIN_PATH $BASEDIR/lib/main.rb

