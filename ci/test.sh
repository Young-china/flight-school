#!/bin/bash

set -e -x

cat version/number

pushd flight-school
  bundle install
  bundle exec rspec
  echo "1"
popd