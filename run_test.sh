#!/bin/sh

bundle exec rake validate && bundle exec rake lint && bundle exec rake spec SPEC_OPTS='--color --format documentation'
