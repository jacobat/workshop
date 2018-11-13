#!/usr/bin/env bash

set -e

echo
echo "Installing gems locally (posture: $posture)"
echo '= = ='

cmd="bundle install --standalone --path=./gems"

echo $cmd
($cmd)

echo '- - -'
echo '(done)'
echo
