#!/usr/bin/env bash
set -xeuo pipefail

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
